import UIKit    //    CoinBits Calculator    SetCellText.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func setCellText(_ cell: CenterAlignedCell, layout: CustomFlowLayout,
                     row: Int, column: Int, headerRows: Int, headerColumns: Int) {
        
        if row >= customFlowLayout!.rows - extraBottomRows {
            cell.titleLabel.text = "-"
        } else {
            if row < headerRows || column < headerColumns {     ///cell.titleLabel.text = "\(column),\(row)"    /// if cell is in header columns / rows
                
                if (vcInt, row) == (3, 1) && headerTitles[2][column] == "Interest" {
                    cell.titleLabel.text = "\(formatAndSetTitleLabel(interestRates[(column + 2)/4-headerColumns]))%"
                } /// above formula works bc. corresponding values of each account are 4 cells apart
                
                if row == headerRows - 1 { var txt=""
                    switch viewControllerType {     // refactor out this switch
                    case .budgetVC :
                        txt = column < headerTitles[0].count ? headerTitles[0][column] : ""
                    case .expensesVC :
                        txt = column < headerTitles[1].count ? headerTitles[1][column] : ""
                        cell.titleLabel.font = smallerHeaderFont
                    case .creditVC :
                        txt = column < headerTitles[2].count ? headerTitles[2][column] : ""
                        cell.titleLabel.font = smallerHeaderFont
                    default: txt = "*"
                    }
                    cell.titleLabel.text = txt
                }
                
                if row >= headerRows && column == 0 {
                    cell.titleLabel.text = setHeaderMonthString(cell, row: row, useDefaultArray: false)  /// cell.titleLabel.text = "\(row)"
                }
                
                cell.titleLabel.textColor = headerTextColor
                
            } else {
                if budgetCalculationColumns[vcInt-1].contains(column) {
                    
                    if column == headerTitles[0].firstIndex(of: "Expenses") {
                        let totalExpenses = calculateExpenses(cell, row: row, column: column)
                        cell.titleLabel.text = formatAndSetTitleLabel(totalExpenses)
                    }
                    
                    if column == headerTitles[0].firstIndex(of: "Balance") {
                        let balance = calculateBalance(cell, row: row, column: column)
                        cell.titleLabel.text = formatAndSetTitleLabel(balance)
                    }
                    
                    if vcInt == 3 && headerTitles[2][column]  == "Interest" {
                        let interest = calculateCreditInterest(cell, row: row, column: column)
                        cell.titleLabel.text = formatAndSetTitleLabel(interest)
                    }
                    
                }
                else {
                    if !(vcInt == 3 && row > headerRows) {
                        setContentsBasedOnInput(cell, row: row, column: column)
                    }
                    else {
                        if column == 1 {
                            
                            let intNPmts = cellLookup(from: [(vcInt,column,row-1), (vcInt,column+1,row-1), (vcInt,column+2,row-1), (vcInt,column+3,row-1)], prynting: false)
                            
                            let rw = row - headerRows - 1
                            //print("ok, interest-sums is \(interestSums)\nand has \(interestSums.count) items; about to reference index \(rw)")
                            
                            if rw < interestSums.count && interestSums.count > 0 {
                                let (oldBalance, interest, minPmt, xtraPmt) = (intNPmts[0],interestSums[rw],intNPmts[2],intNPmts[3])
                                
                                let newBalance = oldBalance + interest - minPmt - xtraPmt
                                print("new credit balance: \(newBalance)")
                                cell.titleLabel.text = formatAndSetTitleLabel(newBalance)
                                addDataAtCell(withColumn: column, withRow: row, textEntered: "\(newBalance)", appendable: false)
                            }
                        }
                    }
                }
            }
        }
    }
}

