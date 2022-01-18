import UIKit    //  ContentSize.swift

extension CustomFlowLayout {
    
    override var collectionViewContentSize: CGSize {                        //print("size = \(contentSize)")
        
        extraSpaceFactor = cellHeightIncrease * CGFloat(autofitOverhangRows)
        
        //autoFitHeightOffset = modelName.contains("iPhone 1") && overhangRows == 0 ? 0 : 0 // offset for (e.g.) iPhone 12 series
        
        ///print("height offset: \(autoFitHeightOffset)")       /// note  autoFitHeightOffset  only needed w/ auto-fitted heights
        
        //let extraSpace = overhangRows > 0 && textFieldDisplayed /*&& modelName.contains("iPhone 1") */ ? textFieldHeight : 0
        
        let w = CGFloat(cols) * widthPlusSpace
        
        let h = (CGFloat(rows) + extraSpaceFactor) * heightPlusSpace ///+ CGFloat(autoFitHeightOffset) ///+ extraSpace
        
        return CGSize(width: w, height: h)
    }
    
}

