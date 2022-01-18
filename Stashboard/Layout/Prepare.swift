import UIKit    //  Prepare.swift

extension CustomFlowLayout {
    
    override func prepare() {                                       //print("🄿", terminator: "")
        
        checkOrientation()
        
        resetKeyboardHeight()                                       //; print("ok, keyboard height is \(keyboardHeight)")
        
        calculateAndResetSizes()
        
        if textFieldDisplayed {
            topVC.rePresentTextField()
        }
        
        //drawTestSquare()  /// for verifying dynamic calculation of navbar height + status bar height, and thus, cell heights
    }
}

