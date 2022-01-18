import UIKit    //    CoinBits Calculator    DataVars.swift    prototype    created by Garth Snyder

var dataAtIndexPath = Dictionary<CellStruct<Int,Int,Int>,[String]>() /// Dictionary keyed by 2-tuple (index path)

///financial planning variables

var initialBalance = 1.0

var interestRates = [10.0]//[10.0, 12.0, 6.0]

let headerTitles = [["Month","Income","Expenses","Payments","Balance", "Credit", "Net Worth"],
                    ["Month","Rent","Financial","Groceries","Transit","Leisure","Unexp."],
                    ["Month","Balance","Interest","Min Pmt","Xtra Pmt","Balance","Interest","Min Pmt","Xtra Pmt", "Balance","Interest","Min Pmt","Xtra Pmt"]] /// write loop to append repeating terms N times where N = # accounts specified

///adding data to cells // (probably offload these expressions into a function called @ beginning of app lifecycle)

let ht0 = headerTitles[0]; let ht2 = headerTitles[2]
let i = Int(ht2.firstIndex(of: "Interest")!)
var budgetCalculationColumns = [[Int(ht0.firstIndex(of: "Expenses")!), Int(ht0.firstIndex(of: "Payments")!),
                                 Int(ht0.firstIndex(of: "Balance")!), Int(ht0.firstIndex(of: "Credit")!), Int(ht0.firstIndex(of: "Net Worth")!)],
                                [], [i, i+4, i+8]]/// next: Payments, Credit, Net Worth

let arr0 = Array(1..<budgetLayout.cols)
let arr1 = Array(1..<expensesBreakdownLayout.cols)
let arr2 = Array(1..<creditBreakdownLayout.cols)

let dataEntryColumns = [arr0.filter { !(budgetCalculationColumns[0].contains($0)) },
                        arr1.filter { !(budgetCalculationColumns[1].contains($0)) },
                        arr2.filter { !(budgetCalculationColumns[2].contains($0)) }]

var editableHeaderPaths = [[Int]]()

var visibleCellRows = [Int]()

var defaultPathOutOfView = [-1, -1]
var selectedIndexPath = defaultPathOutOfView
var cellSetIndexPath = defaultPathOutOfView

///saving components of each data point (value) via separate KeychainWrapper arrays     /// (*rewrite to save whole dictionary to KeychainWrapper?)

var savedDataIndexPaths = [[Int]]() /// index paths where data were added & saved

var savedDataStringArrays = [[String]]()

var keychainStrings =
    [
        "keychainCellPaths",
        "keychainDataDescriptionArrays",
        "lastDateSavedData"
    ]

