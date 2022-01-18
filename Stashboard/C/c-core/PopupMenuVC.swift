import UIKit    //  PopupMenuVC.swift

class PopupMenuVC: UICollectionViewController, UIGestureRecognizerDelegate {
    
    var customFlowLayout : CustomFlowLayout?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.customFlowLayout = layout as? CustomFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (customFlowLayout!.loadsHorizontally) ? customFlowLayout!.cols : customFlowLayout!.rows
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (customFlowLayout!.loadsHorizontally) ? customFlowLayout!.rows : customFlowLayout!.cols
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()                                 //; collectionView.frame = customFlowLayout!.customFrame!
        collectionView.backgroundColor = .darkGray
        //collectionView?.bounces = false
        collectionView?.isUserInteractionEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(CenterAlignedCell.self, forCellWithReuseIdentifier: CenterAlignedCell.popupReuseIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CenterAlignedCell.popupReuseIdentifier,
                                                      for: indexPath) as! CenterAlignedCell
        let layout = customFlowLayout!
        let row = indexPath.item                            ; let column = indexPath.section
        
        cell.backgroundColor = row < layout.lockedHeaderRows || column < layout.lockedHeaderSections
            ? headerColor : .white
        cell.titleLabel.text = "\(column),\(row)"
        cell.titleLabel.textColor = .black
        return cell
    }
}

