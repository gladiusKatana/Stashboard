import UIKit    //    CoinBits Calculator    ZIndex.swift    prototype    created by Garth Snyder

extension CustomFlowLayout {
    
    func setZIndex(row: Int, section: Int, cellAttributes: UICollectionViewLayoutAttributes) {
        
        if row < lockedHeaderRows {
            cellAttributes.zIndex = 3
        }
        
        if section < lockedHeaderSections {
            cellAttributes.zIndex = 3
        }
        
        if section < lockedHeaderSections && row < lockedHeaderRows {
            cellAttributes.zIndex = 4
        }
        
    }
}

