import UIKit    //    CoinBits Calculator    CenterCell.swift    prototype    created by Garth Snyder

class CenterAlignedCell: BaseCell {
    
    static let reuseIdentifier = "CustomCenterAlignedCell"
    static let popupReuseIdentifier = "CustomPopupCell" /// Popup menu collection vc (PopupMenuVC) configured to use center-aligned cells by default
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTitleLabelConstraints(titleLabel, attribute: .centerX)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

