import UIKit    //  MonthString.swift

extension CollectionVC {
    
    func setHeaderMonthString(_ cell: BaseCell, row: Int, useDefaultArray: Bool) -> String {
        
        let monthInt = Calendar.current.component(.month, from: Date()) + (row - customFlowLayout!.lockedHeaderRows) % 12
        
        var txt = "."
        
        let index = monthInt - (customFlowLayout!.lockedHeaderRows)
        
        if viewControllerType == .budgetVC
            || useDefaultArray {
            
            if row < customFlowLayout!.lockedHeaderRows {
                txt = ""
            }
            else {
                if index < months.count {
                    txt = "..." // \(months[index])" //"\(cell.xyCoordinate[0]),\(row)" //
                }
            }
        }
        
        else if viewControllerType == .expensesVC || viewControllerType == .creditVC {
            
            if index > -1 && index < monthsAbbreviated.count {
                txt = "\(monthsAbbreviated[index])"
            }
        }
        
        return txt
    }
    
}

