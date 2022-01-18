import UIKit    //    CoinBits Calculator    Launching.swift    prototype    created by Garth Snyder

extension AppDelegate {
    
    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        topVC.loadDataFromKeychain(showDate: false)
        ///to clear data from app, comment above line on next Run, then save (by double-tapping the Home button)       /// * enable a delete via Settings
        
        modelName = UIDevice.modelName
        if !keyboardSizeFindingMode {(portraitKeyboardHeight,landscapeKeyboardHeight) = getKeyboardHeights(forDevice: modelName)}
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = defaultBackgroundColor
        window?.makeKeyAndVisible()
        globalWindow = window!
        
        backgroundVC = UIViewController()
        backgroundVC.view.backgroundColor = window?.backgroundColor /// must match window's background color, for rotating landscape->portrait
        backgroundVC.view.frame = globalWindow.frame
        
        getOrientationAtLaunch()
        print("launching on \(modelName) in \(launchOrientation) orientation")
        print(formattedDateString(Date(), roundDown: false, showYear: true, prefix: "                      on", suffix: "", dateFormat: .fullDay))
        //; print("columns for budget calculations: \(budgetCalculationColumns); columns for input: \(dataEntryColumns)")
        
        if statusBarUIView!.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBarUIView!.backgroundColor = .clear
        }
        
        setEditableHeaderCells()
        
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        navController = UINavigationController(rootViewController: backgroundVC) /// temporary, unseen initial root view controller
        window?.rootViewController = navController  //; print("VCs*: \(String(describing: nav Controller?.viewControllers))")
        budgetVC.setupAndPresent(vc: budgetVC)
        return true
    }
}

