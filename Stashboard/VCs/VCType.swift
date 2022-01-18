import UIKit    //    CoinBits Calculator    VCType.swift    prototype    created by Garth Snyder

enum CollectionViewType: Int {
    
    case initial = 0
    case budgetVC, expensesVC, creditVC
    
    func caseString() -> String {
        switch self {
        case .initial:
            return "initial"
        case .budgetVC:
            return "budget"
        case .expensesVC:
            return "expenses"
        case .creditVC:
            return "credit"
            
        }
    }
    
    func getNavTitleString() -> String {
        switch self {
        case .initial:
            return ""
        case .budgetVC:
            return "Budget"
        case .expensesVC:
            return "Expenses"
        case .creditVC:
            return "Credit"

        }
    }
    
    func simpleDescription() -> String {
        switch self {
        case .initial:
            return "initial value to satisfy initializer of global collection view controller 'topVC'"
        case .budgetVC:
            return "budget view controller"
        case .expensesVC:
            return "expenses view controller"
        case .creditVC:
            return "credit view controller"
            
        }
    }
    
}

