import UIKit    //    CoinBits Calculator    Orientation.swift    prototype    created by Garth Snyder

extension AppDelegate {
    
    func getOrientationAtLaunch() {
        
        let launchHeight = Double(globalWindow.frame.height)
        let launchWidth = Double(globalWindow.frame.width)
        
        if launchHeight > launchWidth {
            launchOrientation = .portrait
        } else {
            launchOrientation = .landscape
        }
        
        currentOrientation = launchOrientation
        previousOrientation = launchOrientation
    }
}

func checkOrientation() {
    
    let currentHeight = Double(globalWindow.frame.height);   let currentWidth = Double(globalWindow.frame.width)
    if currentHeight > currentWidth {
        currentOrientation = .portrait
    } else if currentHeight < currentWidth {
        currentOrientation = .landscape
    } else {print("\n\nUm, global window frame height & width are equal...")} /// shouldn't get called... unless Apple makes a square device
    //print("check orientation: \(currentOrientation)")
    
    ///if !modelName.contains("iPad Mini 4") { /// or  if !modelName.contains("iPad")  ?  (test)
    if previousOrientation != currentOrientation {              ///print("\n🔄---------------- 🄿 rotated to \(currentOrientation)\n")
        updateUIAfterRotation()
    }
    ///}
}

enum OrientationSize : Int {
    case portrait = 0; case landscape, neither
}

