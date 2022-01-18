import UIKit    //  AppLifecycle.swift

class CustomNavigationController: UINavigationController {  // to fix iOS 15 navigation bar inconsistency ... //see: https://developer.apple.com/forums/thread/682420?page=2 /* & */ https://developer.apple.com/forums/thread/119413
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.updateBarTintColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.updateBarTintColor()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateBarTintColor()
    }
    
    private func updateBarTintColor() {
//        if #available(iOS 13.0, *) {
//            self.navigationBar.barTintColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : .white
//        }
//
//        UINavigationBar.appearance().barTintColor = .orange
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        
    }
}
