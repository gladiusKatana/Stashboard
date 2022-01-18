import UIKit    //  TFieldReturn.swift

extension CollectionVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {              ///print("text field returned")
        exitInputModeWrapper(textField)
        return true
    }
    
    func exitInputModeWrapper(_ textField: UITextField) {
        
        let textEntered = textField.text!
        
        if !(textEntered == "" || textEntered == " " || textEntered == "  ") {  /// if user (for some reason) enters > 2 spaces, well, it's saved
            
            if editableHeaderPaths.contains([vcInt, selectedIndexPath[0], selectedIndexPath[1]]) {
                initialBalance = Double(textEntered)!
            } else {
                addDataAtCell(withColumn: selectedIndexPath[0], withRow: selectedIndexPath[1], textEntered: textEntered,
                              appendable: false)
                cellSetIndexPath = selectedIndexPath
            }
        } else {exitDataEntryMode()}
        
        topVC.balanceSums = []
        topVC.expensesSums = []
        topVC.interestSums = []
        
        textField.text = ""
        setNavBarTitle(viewControllerType.getNavTitleString())
        
        saveDataToKeychain(saveDate: true, resetSavedDataDate: false, showDate: true, pryntData: false)
        
        //collectionView.isScrollEnabled = true
        
        if !keyboardLocked {
            exitDataEntryMode()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in //{ [weak self] in
            reloadLock = false
            self.reloadCV()
//            saveDataToKeychain(saveDate: true, resetSavedDataDate: false, showDate: true, pryntData: false)
        }
    }
}

/*
 //DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
 //self?.saveDataToKeychain(saveDate: true, resetSavedDataDate: false, showDate: true, pryntData: false)
 //}
 */
