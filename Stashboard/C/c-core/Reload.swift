import UIKit    //  Reload.swift

extension CollectionVC {
    
    
    func reloadCV() {
        
        if !reloadLock {
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.collectionView.reloadData()
                reloadLock = true /// prevents concurrent reload-Data()s
            }
            
            //print("↺")
        }
        
        //else {print("🔒reloadLock")}
    }
    
    
    func reloadCollectionViewAfterDelay(_ timeDelay: Double) {
        
        //print("↺d")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
            self.reloadCV()
        }
    }
    
}

