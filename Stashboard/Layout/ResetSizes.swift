import UIKit    //  ResetSizes.swift

extension CustomFlowLayout {
    
    func calculateAndResetSizes() {
        
        (cellWidth, cellHeight) = calculateCellSize()  //; print("cell height is \(cellHeight); cell width is \(cellWidth)")
        resetDimensionIfSquareCellsEnabled()
        
        widthPlusSpace = cellWidth! + hSpace;       heightPlusSpace = cellHeight! + vSpace
        
        ///; print("cell height+space is \(heightPlusSpace); cell width is \(widthPlusSpace)")
        
        let portraitStatusBarHeight = modelName.contains("iPhone11,") || modelName.contains("iPhone12,") ? CGFloat(48) : CGFloat(20) /// check if there are other sizes
        
        var statusBarDelta = 0.0
        
        let statusBarTestHeight = (globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height
        if statusBarTestHeight > portraitStatusBarHeight {
            statusBarDelta = Double(statusBarTestHeight - portraitStatusBarHeight)
        }
        
        adjustForNavigationAndStatusBars(forCollectionVC: topVC, withDelta: statusBarDelta)
    }
    
    func adjustForNavigationAndStatusBars(forCollectionVC collectVC: UICollectionViewController, withDelta delta: Double) {
        
        xOffset = collectVC.collectionView!.contentOffset.x
        
        //print("x offset: \(xOffset)")
        
        yOffset = topVC.collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - delta)
        
        //print("y offset: \(yOffset)")
        
        ///text field shows just above keyboard:
        //print("hmm, text field height is \(textFieldHeight)")
        
        let kbTH = modelName == "iPhone 7" ? keyboardToolbarHeight : 0
        textFieldY = globalWindow.frame.height - keyboardHeight - kbTH - textFieldHeight
    }
}

