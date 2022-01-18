import UIKit    //  VCs_III.swift

let w = 150

let testFrame = CGRect(x: w, y: w, width: w, height: w)

let popupCollectionViewLayout =
    CustomFlowLayout(
        embeddedInNavController: false,
        customFrame: testFrame,
        rows: 6, cols: 6,
        lockedHeaderRows: 1, lockedHeaderSections: 1,
        cellWidth: 60, cellHeight: 60,
        autofitOverhangRows: 0,
        autofitOverhangColumns: 0,
        autoFitWScale: 1, autoFitHScale: 1,
        hSpace: gap, vSpace: gap,
        squareCellMode: .noAutoSquare, loadsHorizontally: false)

var popupCollectionVC = PopupMenuVC(collectionViewLayout: popupCollectionViewLayout)


extension CollectionVC {
    
    func addPopupCollectionView() {
        
        if viewControllerType == .budgetVC {
            
            //popupCollectionVC.view.backgroundColor = .orange /// just for texting purposes
            popupCollectionVC.collectionView.backgroundColor = .black
            
            popupCollectionVC.customFlowLayout?.customFrame = testFrame
            popupCollectionVC.collectionView.frame = testFrame
            
            view.addSubview(popupCollectionVC.view)
        }
    }
}

