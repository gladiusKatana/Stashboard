import UIKit    //    CoinBits Calculator    CalculateExpenses.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func calculateExpenses(_ cell: CenterAlignedCell, row: Int, column: Int) -> Double {    ///print("calculating expenses @ \(column),\(row)")
        
        var result = 0.0
        let headers = (customFlowLayout?.lockedHeaderRows)!
        
        
        if row >= headers {
            
            let inXp = cellLookup(from: [(2,1,row),(2,2,row),(2,3,row), /// ! Hardcode these columns, here or in DataVars.swift (else need more logic)
                                         (2,4,row),(2,5,row),(2,6,row)], prynting: false)
            
            result = inXp.reduce(0, +)
            
            ///print("result = \(result) : reduced  \(inXp)") ///print("net: \(result)")
            ///print("\nrow=\(row)");  print("month #\(row-headers+1) will lookup expense sums #\(row-headers) of \(expensesSums.count)")
            
//            let previousValue = row == headers ? 0 : expensesSums[row - headers - 1]
//            totalExpenses = result + previousValue
            
            let rowMax = customFlowLayout!.rows - headers  - 1
            
            if expensesSums.count <= rowMax {
                expensesSums.append(result)
            }
            else {
                expensesSums[row - headers] = result
            }
            
            ///print("-----------------now \(expensesSums.count) total-expense values: \(expensesSums)")
            ///setupViewTitle("\(expensesSums.count); \(expensesSums.last!)", numLines: 1, alignment: .left) /// for testing without Xcode Run
        }
        
//        cell.titleLabel.text = formatAndSetTitleLabel(result)
        return result
    }
}

