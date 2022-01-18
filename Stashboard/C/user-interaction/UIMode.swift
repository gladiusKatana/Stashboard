import UIKit    //    CoinBits Calculator    UIMode.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func exitDataEntryMode() {
        
        textField.removeFromSuperview()
        
        setupNavBarButtons(grayTwo, greyIndex: buttonColorIndex, disabler: false)
        
        keyboardHeight = 0
        keyboardToolbarHeight = 0
        
        textFieldEditingMode = false
        textFieldDisplayed = false
        
        selectedIndexPath = defaultPathOutOfView
    }
}

