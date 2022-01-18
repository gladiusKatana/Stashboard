import UIKit    //  SetEditableHeaders.swift


func setEditableHeaderCells() {     //print("setting editable headers")
    
    
    let bdgLayout = budgetVC.customFlowLayout!
    
    lastNonOverhangColumn = bdgLayout.cols - bdgLayout.autofitOverhangColumns - 1
    
    editableHeaderPaths.append([1, lastNonOverhangColumn, 1])
    
    
    
    for col in (0 ... creditVC.customFlowLayout!.cols - 1) {
        
        if headerTitles[2][col] == "Interest" {
            
            editableHeaderPaths.append([3, col, 1]) /// append index path [vc,column,row] /// vc = view controller
            
        }
        
    }
    
    //print("editable header paths: \(editableHeaderPaths)")
    
}

