import UIKit    //  CellOrder.swift

extension CollectionVC {
    
    func cellQueueNumber(from indexPath: [Int]) -> Int {
        
        var rankInt = 0
        
        let vc = indexPath[0]
        let column = indexPath[1]
        let row = indexPath[2]
        
        let headerColumns = customFlowLayout!.lockedHeaderSections
        let headerRows = customFlowLayout!.lockedHeaderRows
        
        rankInt = vc * 100000 + (column - headerColumns) * customFlowLayout!.rows + row - headerRows
        
        //let ndx = (vc,column,row)
        //print("rank of item \(ndx) is \(Double(rankInt).doubleRepresentedWithCommas() ?? "-99") ")
        
        return rankInt
    }
    
}

