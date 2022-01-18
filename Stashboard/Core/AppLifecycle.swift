import UIKit    //  AppLifecycle.swift

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {             print("▶️became active")
        
//        topVC.expensesSums = []
//        topVC.balanceSums = []
        ////// ↑ line above: interesting patch - not needed anymore but may make Stack Overflow post, as the patch (when it was needed) revealed an interesting iOS quirk
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //{ [weak self] in
            reloadLock = false
            topVC.reloadCV()
        }
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {         //print("🌔will enter foreground\n")
        
        checkOrientation()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {            print("\n⏸will resign active")
        
        topVC.saveDataToKeychain(saveDate: true,
                                 resetSavedDataDate: true,
                                 showDate: true,
                                 pryntData: true)
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {          //print("🌘entered background")
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {               print("🌑terminated")
    }
    
}

