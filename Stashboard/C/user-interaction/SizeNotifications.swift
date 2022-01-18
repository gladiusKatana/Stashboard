import UIKit    //    CoinBits Calculator    SizeNotifications.swift    prototype    created by Garth Snyder

import NotificationCenter

extension CollectionVC {
    
    func statusBarHeightChangeNotificationSetup() {
        
        if phones.contains(modelName) {
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.removeAllDeliveredNotifications()          /// to remove all delivered notifications
            notificationCenter.removeAllPendingNotificationRequests()     /// to remove all pending notifications not delivered yet but scheduled
            
            /*NotificationCenter.default.addObserver(self, selector: #selector(reloadCV),
             name: UIApplication.willChangeStatusBarFrameNotification, object: nil)*/
        }
    }
    
    /// may not need the below method (which replaces the willChangeStatusBarFrameNotification observer above). Reloading after resizing affects the layout object, so is done in the layout method  prepare()
    
    /*override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
     super.viewWillTransition(to: size, with: coordinator) /// if this line is missing, child will not get the delegate call in its viewWillTransition
     reloadLock = false; reloadCV()
     print("size changed")
     }*/
    
    func keyboardNotificationSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(showKBoard),
                                               name: UIResponder.keyboardWillShowNotification, object: nil
        )
    }
    
    @objc func showKBoard(_ notification: Notification) { //print("⌨️")
        textFieldDisplayed = true
        
        if keyboardSizeFindingMode {
            checkOrientation()
            
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                keyboardHeight = keyboardFrame.cgRectValue.height                       ; print("⌨️height: \(keyboardHeight)")
                
                if currentOrientation == .portrait {
                    portraitKeyboardHeight = keyboardHeight
                    if !firstPortraitKeyboardPresented {firstPortraitKeyboardPresented = true}
                }
                
                if currentOrientation == .landscape {
                    landscapeKeyboardHeight = keyboardHeight
                    if !firstLandscapeKeyboardPresented {firstLandscapeKeyboardPresented = true}
                }
            }
            topVC.reloadCV()
        }
    }
}

