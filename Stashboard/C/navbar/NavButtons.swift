import UIKit    //  NavButtons.swift

extension CollectionVC {
    
    func setupButton(disabler: Bool, title: String, selector: Selector) -> UIBarButtonItem {
        
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        
        let selector =
            disabler && ![#selector(reloadCVWrapperMethod)].contains(selector)
            ? #selector(nullSelector)
            : selector
        
        return UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self,
                               action: selector)
    }
    
    @objc func nullSelector() {print("button disabled")}
    
    @objc func reloadCVWrapperMethod() {             /// For developer testing purposes.
        print("↺ reload collection view via button") /// ACTUATED BY tapping an invisible button to the left of the leftmost visible nav bar button
        reloadLock = false
        reloadCV()
        ///visibleCellRows = getVisibleCellRows(prynting: true) // for testing purposes
    }
    
    
    @objc func keyboardLockWrapper() {
        if textFieldDisplayed && keyboardLocked {
            exitDataEntryMode()
            reloadCV()
        }
        
        keyboardLocked = !keyboardLocked
        setupNavBarButtons(grayTwo, greyIndex: buttonColorIndex, disabler: textFieldDisplayed)
    }
    
    @objc func buttonWrapperMethodforFirstVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: budgetVC)
        }
    }
    
    @objc func buttonWrapperMethodforSecondVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: expensesVC)
        }
    }
    
    @objc func buttonWrapperMethodforThirdVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: creditVC)
        }
    }
}

