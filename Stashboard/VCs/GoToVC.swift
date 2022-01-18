import UIKit    //  GoToVC.swift

extension CollectionVC {
    
    func gotoView(vc: CollectionVC) {                                                       //print("\nshowing vc \(vc)")
        
        if topVC != vc {
            setupTitleAndPresentViewController(vc: vc) { () -> () in //print("just presented the \(vc.viewControllerType)-view")
                ///...
            }
        } //else {print("you're already looking at the \(vc.viewControllerType)-view")}
    }
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {       ///print("\ndismissing/presenting vc: \(vc)")
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: UICollectionViewController) {                                  //print("setup and present")
        
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            
            self?.dismissNavController {
                
                let newVC = UINavigationController(rootViewController: vc)
                newVC.modalPresentationStyle = .fullScreen
                navController?.present(newVC, animated: false, completion: nil)
                
                self?.setTopViewController() /// try commenting this: should see that a vc of type 'initial' was root vc when this method was first called
                
                //reloadLock = false
                //self?.reloadCollectionViewAfterDelay(0)
            }
        }
    }
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
}

