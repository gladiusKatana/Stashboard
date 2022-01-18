import UIKit    //  InputContent.swift

extension CollectionVC {
    
    func setContentsBasedOnInput(_ cell: CenterAlignedCell, row: Int, column: Int) {
        
        if column == cellSetIndexPath[0] && row > cellSetIndexPath[1] && cellSetIndexPath != defaultPathOutOfView {
            ///if row == customFlowLayout?.lockedHeaderRows {
            
            if let values = dataAtIndexPath[CellStruct(values:(vcInt, column, row - 1))] {
                //let values = cellLookup(from: [(vcInt,column,row-1)], prynting: false)
                representAsDoubleWithCommas("\(values.last!)", addingToDataModel: true, cell: cell, row: row, column: column)
                cellSetIndexPath = [column,row]
            }
            else {cell.titleLabel.text = "..."}
        } else {
            if let values = dataAtIndexPath[CellStruct(values:(vcInt, column, row))], values.count > 0 {
                //let values = cellLookup(from: [(vcInt,column,row)], prynting: false)
                representAsDoubleWithCommas("\(values.last!)", addingToDataModel: false, cell: cell, row: row, column: column)
            }
        }
        //}
        
        if vcInt == 1 && column == dataEntryColumns[vcInt-1].last && row == customFlowLayout!.rows - extraBottomRows - 1 { ///row 26
            //            cellSetIndexPath = defaultPathOutOfView //; print("index path of cell selected: \(cellSetIndexPath)")
            ///print("total expenses: \(expensesSums.reduce(0, +))  from \(expensesSums.count) values: \(expensesSums)  (called from \(viewControllerType.simpleDescription()), last cell \(column),\(row))")
        }
    }
    
    func representAsDoubleWithCommas(_ dataString: String, addingToDataModel: Bool,
                                     cell: CenterAlignedCell, row: Int, column: Int) {
        
        if let doubleData = Double(dataString) {
            let txt = "\(doubleData.doubleRepresentedWithCommas() ?? "")"
            if addingToDataModel {
                addDataAtCell(withColumn: column, withRow: row, textEntered: dataString, appendable: false)
            }
            cell.titleLabel.text = txt
        }
    }
}

