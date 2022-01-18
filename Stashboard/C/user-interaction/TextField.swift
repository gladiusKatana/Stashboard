import UIKit    //  TextField.swift

extension CollectionVC {
    
    func presentTextFieldAndReload(after delay: Double, forDataAtRow row: Int?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.setupNavBarButtons(grayTwo, greyIndex: self.buttonColorIndex, disabler: true)
            ///self.customFlowLayout?.setTextFieldSize()
            self.formatAndPresentTextField("")  /// (forDataAtRow row: Int?)
            reloadLock = false
            self.reloadCV()
        }
    }
    
    func formatAndPresentTextField(_ textFieldContents: String) {                   ///print("\nformatting & presenting text field")
        if keyboardAsNumberPad {
            textField.keyboardType = .decimalPad
            textField.addDoneCancelToolbar()
        }
        
        let width = globalWindow.frame.width
        ///let overhangCols = customFlowLayout!.autofitOverhangColumns  ///; let cols = CGFloat(customFlowLayout!.cols - overhangCols)
        
        textFieldWidth = width /// * (cols - 2) / cols /// keep 1 column to right, 1 to left of text field
        let textFieldX = CGFloat(0) /// width / cols
        
        if textFieldEditingMode {
            textField.text = textFieldContents
        }
        
        textField.delegate = self
        textField.frame = CGRect(x: textFieldX, y: textFieldY, width: textFieldWidth, height: textFieldHeight)
        view.addSubview(textField)
        textFieldDisplayed = true
        textField.becomeFirstResponder()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in      //print("\n🔤text field displayed")
            visibleCellRows = (self?.getVisibleCellRows(prynting: true))!
        }
    }
}

