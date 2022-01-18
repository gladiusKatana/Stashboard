import UIKit    //  VCLifecycle.swift

extension CollectionVC {
    
    
    override func viewDidLoad() {                       ///print("💾view loaded: \(self.viewControllerType.caseString()) loaded")
        super.viewDidLoad()
        
        collectionView.backgroundColor = globalWindow.backgroundColor
        collectionView.bounces = false
        
        statusBarHeightChangeNotificationSetup()
        keyboardNotificationSetup()
        setTopViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        vcInt = viewControllerType.rawValue
        setNavBarTitle(viewControllerType.getNavTitleString())
        setupNavBarButtons(grayTwo, greyIndex: buttonColorIndex, disabler: textFieldDisplayed)
        setTopViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {     ///print("💾view appeared: \(self.viewControllerType.caseString()) loaded")
        super.viewDidAppear(animated)
        
        vcInt = viewControllerType.rawValue
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            visibleCellRows = (self?.getVisibleCellRows(prynting: false))!
        }
        
        reloadLock = false
        reloadCV()
        
        //addPopupCollectionView()  /// implemented here for experimental purposes only
    }
}

