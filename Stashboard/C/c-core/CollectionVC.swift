import UIKit    //  CollectionVC.swift

class CollectionVC: UICollectionViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var viewControllerType = CollectionViewType.initial;        var vcInt = 0;              var balanceSums : [Double] = []
    var customFlowLayout: CustomFlowLayout?;                    var buttonColorIndex: Int?; var expensesSums : [Double] = []
    var showLoadAndAppearIndicationInConsole = false;           var backgroundColor = UIColor.clear; var totalExpenses = 0.0
    var interestSums : [Double] = []; var totalInterest = 0.0
    var navbarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1366, height: 20)) ///1366 is width (# of points) of the ipad pro 12.9"
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.backgroundColor = .lightGray // darkKeyboardColor
        textField.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.isEnabled = true
        return textField
    }()
    
    init(_ vcType: CollectionViewType, backgroundColor: UIColor,
         buttonColorIndex: Int?, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.viewControllerType = vcType
        self.backgroundColor = backgroundColor
        self.buttonColorIndex = buttonColorIndex
        self.customFlowLayout = layout as? CustomFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (customFlowLayout!.loadsHorizontally) ? customFlowLayout!.cols : customFlowLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (customFlowLayout!.loadsHorizontally) ? customFlowLayout!.rows : customFlowLayout!.cols
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {return true}
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        guard let customLayout = collectionViewLayout as? CustomFlowLayout else {
//            print("failed to downcast custom collection view layout in instance method  collectionView(_:layout:sizeForItemAt:)")
//            return CGSize(width: 0, height: 0)
//        }
//        
//        return CGSize(width: customLayout.cellWidth!, height: customLayout.cellHeight!)
//    }
}

