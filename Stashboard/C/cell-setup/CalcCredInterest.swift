import UIKit    //    CoinBits Calculator    CalcCredInterest.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func calculateCreditInterest(_ cell: CenterAlignedCell, row: Int, column: Int) -> Double { ///print("calculating cred.bal. @ \(column),\(row)")
        
        var interest = 0.0
        let headerRows = (customFlowLayout?.lockedHeaderRows)!
        let headerColumns = (customFlowLayout?.lockedHeaderSections)!
        
        if row >= headerRows {
            
            let bal = cellLookup(from: [(3,column-1,row)], prynting: false)
            
            let index = (column + 2)/4-headerColumns
            
            interest = bal.first! * interestRates[index] / 1200
            
            print("interest = \(interest)  col=\(column) row=\(row)")
            
//            let previousValue = row == headerRows ? 0 : interestSums[row - headerRows - 1]
//            totalInterest = interest + previousValue
            
            let rowMax = customFlowLayout!.rows - headerRows  - 1
            
            if interest != 0 {
                if interestSums.count <= rowMax {
                    interestSums.append(interest)
                }
                else {
                    interestSums[rowMax] = interest
                }
            }
            
            ///print("-----------------now \(interestSums.count) interest values: \(interestSums)")
            ///setupViewTitle("\(interestSums.count); \(interestSums.last!)", numLines: 1, alignment: .left) /// for testing without Xcode Run
        }
        
//        cell.titleLabel.text = formatAndSetTitleLabel(result)
        return interest
    }
}

