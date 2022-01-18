import UIKit    //    CoinBits Calculator    VisibleRows.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func getVisibleCellRows(prynting: Bool) -> [Int] {
        
        var visibleRows = [Int]()
        
        guard let cellHeight = customFlowLayout!.cellHeight else {                  //print("no cell height yet")
            return visibleRows
        }
        
        let cellsUnderHeaders = Int(round(yOffset / cellHeight))    //; print("\(cellsUnderHeaders) cells under headers")
        let startingRow = headerRows + cellsUnderHeaders
        
        let nonHeaderRows = Array(startingRow ... startingRow + rowsPerScreen - headerRows - 1)
        visibleRows = Array(0 ... headerRows) + nonHeaderRows
        
        if prynting {
            //print("non-headers visible: \(nonHeaderRows)")
        }
        
        return visibleRows
    }
    
}

