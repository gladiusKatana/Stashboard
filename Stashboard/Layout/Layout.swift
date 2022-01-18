import UIKit    //  Layout.swift

class CustomFlowLayout : UICollectionViewFlowLayout {
    var cols = 0;   var rows = 0;           var lockedHeaderRows = 0;               var lockedHeaderSections = 0
    var autofitOverhangRows = 0;            var autofitOverhangColumns = 0;         var autoFitHeightOffset = 0
    var customFrame: CGRect?;               var cellWidth: CGFloat?;                var cellHeight: CGFloat?
    var widthPlusSpace = CGFloat(0);        var heightPlusSpace = CGFloat(0);       var cellHeightIncrease = CGFloat(0)
    var autoFitWScale: CGFloat?;            var autoFitHeightScale: CGFloat?;       var extraSpaceFactor = CGFloat(0)
    var hSpace = CGFloat(0);                var vSpace = CGFloat(0);    var xDefault = CGFloat(0);   var yDefault = CGFloat(0)
    var squareCells = false;                var embeddedInNavController = false;    var loadsHorizontally = false
    var squareCellMode : SquareCellMode;    var cellDimensionsMode = CellDimensionsMode.noHardcoding
    
    init(embeddedInNavController: Bool, customFrame: CGRect?, rows: Int, cols: Int,
         lockedHeaderRows: Int, lockedHeaderSections: Int,
         cellWidth: CGFloat?, cellHeight: CGFloat?, autofitOverhangRows: Int, autofitOverhangColumns: Int,
         autoFitWScale: CGFloat?, autoFitHScale: CGFloat?,
         hSpace: CGFloat, vSpace: CGFloat, squareCellMode: SquareCellMode, loadsHorizontally: Bool) {
        
        self.embeddedInNavController = embeddedInNavController
        self.customFrame = customFrame
        if !loadsHorizontally {self.rows = rows;    self.cols = cols}
        else {                 self.rows = cols;    self.cols = rows}
        
        self.lockedHeaderRows = lockedHeaderRows;           self.lockedHeaderSections = lockedHeaderSections
        self.cellWidth = cellWidth;                         self.cellHeight = cellHeight
        self.autofitOverhangRows = autofitOverhangRows;     self.autofitOverhangColumns = autofitOverhangColumns
        self.autoFitHeightScale = (autoFitHScale != nil) ? autoFitHScale : 1
        self.autoFitWScale = (autoFitWScale != nil) ? autoFitWScale : 1
        self.hSpace = hSpace;                               self.vSpace = vSpace
        self.squareCellMode = squareCellMode;               self.loadsHorizontally = loadsHorizontally
        super.init()
        
        if cellWidth != nil && cellHeight != nil {cellDimensionsMode = .widthAndHeightHardcoded}
        else if cellWidth == nil && cellHeight != nil {cellDimensionsMode = .heightHardcoded}
        else if cellWidth != nil && cellHeight == nil {cellDimensionsMode = .widthHardcoded}
        else    {cellDimensionsMode = .noHardcoding} //; print(cellDimensionsMode.simpleDescription())
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {return true}
    override func invalidateLayout() {super.invalidateLayout()}
}

