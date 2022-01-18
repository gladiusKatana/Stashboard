import UIKit    //    CoinBits Calculator    TapCell.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {                    //print("👆🏽")
        
        let layout = customFlowLayout!; let hCols = layout.lockedHeaderSections
        let row = indexPath.item;       let column = indexPath.section
        
        if dataEntryColumns[vcInt-1].contains(column)
            && (layout.lockedHeaderRows ..< rowsPerView - extraBottomRows).contains(row)
            || editableHeaderPaths.contains([vcInt,column,row])
        {
            let cell = collectionView.cellForItem(at: indexPath) as! BaseCell
            selectedIndexPath = [column, row]                       //; print("👆🏽selected index path \(selectedIndexPath)")
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                cell.backgroundColor = tappedCellColor
            }
            
            let vc = viewControllerType.rawValue                    //; print("vc tapped: \(vc)")
            let defaultStr = "\(headerTitles[vc-1][column]) for \(setHeaderMonthString(cell, row: row, useDefaultArray: true))"
            
            if (vcInt, column,row) == (1,lastNonOverhangColumn,1) {
                textField.text = "\(initialBalance)".formatDollarsAndCentsDecimals(testPrynt: false)
                textField.placeholder = "cash right now (cash on hand)"
                setNavBarTitle("Cash Right Now")
            } else if (vcInt,row) == (3,1) { /// no need to specify column - only certain columns will have been enabled for user-input
                textField.text = "\(interestRates[(column + 2)/4-hCols])".formatDollarsAndCentsDecimals(testPrynt: false)
                textField.placeholder = "interest rate (%)"
                setNavBarTitle("Interest Rate (%)")
            } else {
                if let cellContents = cellLookup(from: [(viewControllerType.rawValue, column,row)], prynting: false).first {
                    let str = "\(cellContents)".formatDollarsAndCentsDecimals(testPrynt: false)
                    ///print("cell contents @ \(column),\(row): \(str)")
                    textField.text = cellContents == 0 ? "" : "\(str)"
                    textField.placeholder = defaultStr
                } else {textField.placeholder = defaultStr}
                setNavBarTitle(defaultStr)
            }
            
            if textFieldDisplayed {presentTextFieldAndReload(after: 0, forDataAtRow: nil)}
            else {
                if !editableHeaderPaths.contains([vc,column,row]) {
                    topVC.autoScroll(toShowRow: selectedIndexPath[1], animated: true, delay: 0.45)
                }
                presentTextFieldAndReload(after: 0.05, forDataAtRow: nil)
            }
        }
    }
}

