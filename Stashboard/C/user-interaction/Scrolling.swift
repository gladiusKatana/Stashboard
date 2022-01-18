import UIKit    //    CoinBits Calculator    Scrolling.swift    prototype    created by Garth Snyder

extension CollectionVC {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {                 //print("scrolled  yo = \(yOffset)")
        
        visibleCellRows = getVisibleCellRows(prynting: false)
        
    }
    
    
    func autoScroll(toShowRow row: Int, animated: Bool, delay: Double) {            //print("auto scrolling to row \(row)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(delay)) { [self] in
            
            /*self.collectionView.delegate = self
            self.collectionView.reloadData()
            self.collectionView.layoutIfNeeded()*/  /// looks like this line & 2 above are not needed (here) despite reading they were in a ~similar feature
            
            self.collectionView.scrollToItem(at: IndexPath(row: row + 1,
                                                           section: 0), at: .bottom, animated: animated)
            
            //self.collectionView.isScrollEnabled = false /// prob. won't use this... accidental scrolling pretty easy to avoid
        }
    }
    
}

