import UIKit    //  CalculateBalance.swift

extension CollectionVC {
    
    func calculateBalance(_ cell: CenterAlignedCell, row: Int, column: Int) -> Double {    ///print("calculating values @ \(column),\(row)")
        
        var result = 0.0
        let headers = (customFlowLayout?.lockedHeaderRows)!
        let rw = row - headers
        
        if row >= headers, rw < expensesSums.count {
            
            let vc = viewControllerType.rawValue
            let inXp = cellLookup(from: [(vc,1,row)], prynting: false)/// ! Hardcode these columns, here / in DataVars.swift (else need more logic)
            
            let (income,expenses,payments) = (inXp[0],expensesSums[rw],0.0) /// expensesSums[rw] , inXp[2]
            
            let initialValue = row == headers ? initialBalance : 0
            let net = income - expenses - payments + initialValue
            
            //print("values \((income,expenses,payments)); will get expenses from index \(rw); expenses-sums count: \(expensesSums.count)")
            ///print("\nrow=\(row)");  print("month #\(row-headers+1) will lookup balance sums #\(row-headers) of \(balanceSums.count)")
            ///print("net = \(net) : \(income) - \(expenses) - \(payments) + \(initialValue)  (row \(row))")
            
            let index = row - headers - 1
            
            if index > -1 && index < balanceSums.count {
                
                let previousValue = row == headers ? 0 : balanceSums[row - headers - 1]
                
                let runningSum = net + previousValue
                
                result = runningSum
                
                if balanceSums.count <= customFlowLayout!.rows - headers - 1 {
                    balanceSums.append(runningSum)
                } else {
                    balanceSums[row - headers] = (runningSum)
                }
            }
            //print("now \(balanceSums.count) balance running-sums: \(balanceSums)")
            ///setupViewTitle("\(balanceSums.count); \(balanceSums.last!)", numLines: 1, alignment: .left) /// for testing without Xcode Run
        }
        return result
    }
}

