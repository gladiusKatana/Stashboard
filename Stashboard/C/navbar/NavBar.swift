import UIKit    //    CoinBits Calculator    NavBar.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    func setupNavBarButtons(_ greyoutColor: UIColor?, greyIndex: Int?, disabler: Bool) {  //print("setting up nav bar buttons")
        
        let firstButton = setupButton(disabler: disabler, title: "letterButton_B",
                                      selector: #selector(buttonWrapperMethodforFirstVC))
        
        let secondButton = setupButton(disabler: disabler, title: "letterButton_E",
                                       selector: #selector(buttonWrapperMethodforSecondVC))
        
        let thirdButton = setupButton(disabler: disabler, title: "letterButton_C",
                                       selector: #selector(buttonWrapperMethodforThirdVC))
        
        var lockKeyboardButton = UIBarButtonItem()
        
        if !keyboardLocked {
            lockKeyboardButton = setupButton(disabler: disabler, title: "keyboardLockButtons.001 copy",
                                             selector: #selector(keyboardLockWrapper))
            
        } else {lockKeyboardButton = setupButton(disabler: disabler, title: "keyboardLockButtons.002 copy",
                                                 selector: #selector(keyboardLockWrapper))}
        
        let reloadButton = setupButton(disabler: disabler, title: "reloadButton",   /// used for development / testing
                                       selector: #selector(reloadCVWrapperMethod))
        
        var barButtonColors = [UIColor]()
        
        let buttons = [lockKeyboardButton, thirdButton, secondButton, firstButton, reloadButton] /// reload button is transparent
        navigationItem.rightBarButtonItems = buttons
        
        let color = graySeven /// default color, for buttons that present all but the current top view controller
        
        for _ in buttons {
            if barButtonColors.count <= buttons.count {barButtonColors.append(color)}
        }
        
        for button in buttons {
            guard let greyout = greyoutColor else {print("no greyout color"); return}
            guard let index = buttons.firstIndex(of: button) else {print("error finding button index"); return}
            
            let defaultColor = barButtonColors[index]
            button.tintColor = defaultColor
            
            if index == greyIndex {button.tintColor = greyout}
            if button == reloadButton {button.tintColor = .clear}
            if disabler && ![reloadButton].contains(button) {button.tintColor = greyout}
            if button == lockKeyboardButton && keyboardLocked {button.tintColor = darkRed}
        }
    }
}

