import UIKit    //  RotationUIUpdate.swift

func updateUIAfterRotation() {
    
    topVC.setupViewTitle(topVC.navbarTitleLabel.text ?? "***", numLines: 1, alignment: .left)
    
    if textFieldDisplayed {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            topVC.autoScroll(toShowRow: selectedIndexPath[1], animated: false, delay: 0.5)
        }
    }
    
    autoScaledTextField = false
    textFieldHeight = 0
    
    let layout = topVC.customFlowLayout!
    
    if currentOrientation == .landscape {
        layout.autofitOverhangColumns = 0
    }
    else {
        layout.autofitOverhangColumns = 2
    }
    
    topVC.setupTitleAndPresentViewController(vc: topVC) { () -> () in
        ///reloadLock = false
        ///topVC.reloadCV()     /// only really useful for cell font size readjustment upon rotations / other scaling changes
    }
    
    previousOrientation = currentOrientation
    
}

