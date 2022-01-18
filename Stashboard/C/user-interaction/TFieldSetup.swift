import UIKit    //    CoinBits Calculator    TFieldSetup.swift    prototype    created by Garth Snyder

//                                               *TField = text field
extension CollectionVC {
    
    func rePresentTextField() {                 //print("re-presenting text field & keyboard")
        let contents = textField.text!
        formatAndPresentTextField(contents)
    }
}

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil,
                              onCancel: (target: Any, action: Selector)? = nil) {
        
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        
        let n = currentOrientation == .portrait ? 0.75 : 1.5
        toolbar.frame = CGRect(x: 0, y: globalWindow.frame.height - keyboardHeight,
                               width: globalWindow.frame.width, height: topVC.customFlowLayout!.cellHeight! * CGFloat(n))
        //toolbar.sizeToFit() // for default iOS sizing, use this line instead of the 2 lines above
        keyboardToolbarHeight = toolbar.frame.height
        
        toolbar.tintColor = .black // xcodeDefaultDark // semiPlatinum
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {                     //print("tapped done button")
        topVC.exitInputModeWrapper(topVC.textField)
    }
    
    @objc func cancelButtonTapped() {                   //print("tapped cancel button")
        topVC.exitInputModeWrapper(topVC.textField)
    }
}

