import UIKit    //  SetTopVC.swift

extension UICollectionViewController {
    
    func setTopViewController() {
        
        guard let viewControllers = self.navigationController?.viewControllers /// despite the 's', should only contain 1 vc (the one presented)
        
        else {
            
            //var str = ""
            //
            //if let collectionVC = self as? CollectionVC {
            //str = "\(collectionVC.viewControllerType)"
            //}
            //else {str = "(not set)"}
            //
            //print("top view controller var (topVC) not set, root view controller type:\n.\(str)")
            
            return
        }
        
        //print("view controllers: \(viewControllers)")
        
        guard viewControllers.count == 1 else {
            print("\n\nnavigation controller, somehow, contains more than one view controller at once  ... \n\nvc count: \(viewControllers.count)   \n\nvcs: \(viewControllers)'\n\n")
            return
        }
        
        guard let customVC = viewControllers[0] as? CollectionVC else {
            print("...could not downcast vc")
            return
        }
        
        topVC = customVC
        
        //print("top view controller var (topVC) is set, root view controller type:\n.\(topVC.viewControllerType)")
    }
}

