import UIKit    //    CoinBits Calculator    BaseCell.swift    prototype    created by Garth Snyder

class BaseCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    var cellColor = UIColor.clear
    var cellDate = Date()
    var xyCoordinate = [-2, -2] /// = [column, row]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
        titleLabel.textColor = defaultCellTextColor
        titleLabel.font = defaultCellFont
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        layer.borderColor = UIColor.clear.cgColor
        
        titleLabel.textColor = defaultCellTextColor
        titleLabel.font = defaultCellFont
        titleLabel.text = "" /// reset if ever gets set to a non-blank string
        
        self.backgroundColor = .black
    }
    
    func addTitleLabelConstraints(_ titleLabel: UILabel, attribute: NSLayoutConstraint.Attribute) {
        self.addSubview(titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: attribute, relatedBy: .equal,
                                         toItem: self, attribute: attribute, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

