import UIKit    //    CoinBits Calculator    RCellSetup.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func rightCellSetup(_ cell: RightAlignedCell, indexPath: IndexPath,
                        layout: CustomFlowLayout, lastNonOverhangColumn: Int) -> RightAlignedCell  {
        
        let row = indexPath.row; let col = indexPath.section
        
        cell.xyCoordinate = [col, row]
        
        cell.titleLabel.numberOfLines = 1
        
        cell.titleLabel.lineBreakMode = .byCharWrapping
        
        cell.titleLabel.textColor = platinum //semiPlatinum
        
        if [col,row] == selectedIndexPath {
            cell.backgroundColor = headerTappedCellColor; cell.cellColor = headerTappedCellColor
        } else {
            cell.backgroundColor = headerColor; cell.cellColor = headerColor
        }
        
        if  (vcInt, col, row) == (1, lastNonOverhangColumn, 1) {
            cell.titleLabel.text = "Cash $\(formatAndSetTitleLabel(initialBalance))   "
        }
        
        if (col, row) == (layout.cols - 1, 0) {
            cell.titleLabel.text = formattedDateString(dateLastSavedData, roundDown: false, showYear: true,
                                                       prefix: "Last saved ",         /// probably update this to being the last date saved
                                                       suffix: "  ", dateFormat: .fullDayShortWithMins)
            cell.titleLabel.textColor = semiPlatinum
        }
        
        return cell
    }
}

