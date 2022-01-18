import UIKit    //    CoinBits Calculator    VCs.swift    prototype    created by Garth Snyder


var backgroundVC = UIViewController()

var topVC = CollectionVC(.initial, backgroundColor: UIColor.clear,
                         buttonColorIndex: nil, collectionViewLayout: budgetLayout)

var headerHeightFactor = CGFloat(1)         /// height-factors determine relative heights of header cells vs regular cells (see Attributes.swift)
var cellHeightFactor = CGFloat(1)

let gap = CGFloat(0)                        /// if nonzero, do not make this smaller than 0.5-0.6, or lines may be drawn inconsistently (also, use standard colors)
let hideGapsInHeaders = true                /// this mostly = true in e.g. autolayout testing only ... gaps, if shown, can temporarily disappear upon e.g. scrolling

let headerRows = 3
let extraBottomRows = 7                     /// should be around ~ 6 - 8 in practise (depends on the height of each device's keyboard)
let rowsPerScreen = 12 + headerRows + (extraBottomRows == 1 ? 1 : 0)
let rowsPerView = 24 + headerRows + extraBottomRows

var overhangRows = rowsPerView - rowsPerScreen;     var lastNonOverhangColumn = -1 /// gets set in ReturnCell.swift

var budgetLayout =
    CustomFlowLayout(
        embeddedInNavController: true,      ///  if true, it's fullscreen (with a nav bar button to navigate to its collection view controller's view); ...
        ///                                  ... if false, it's a window with a custom frame (frame is set prior to presenting the view controller)
        customFrame: nil,                   ///  if nil, it defaults to the app's window frame (as when embeddedInNavController = true)
        rows: rowsPerView, cols: 7,
        lockedHeaderRows: headerRows, lockedHeaderSections: 1,
        cellWidth: nil, cellHeight: nil,    /// if either is nil, screen width and/or height auto-fitted (else, auto-fit scalars below ignored, ie set to 1.0)
        autofitOverhangRows: overhangRows,
        autofitOverhangColumns: 2,
        autoFitWScale: 1, autoFitHScale: 1, ///  if either of these parameters are nil, they default to 1.0
        hSpace: gap, vSpace: gap,           ///  gaps between the cells
        squareCellMode: .noAutoSquare,      ///  optional auto-scaling to make cells square, by specifying 1 dimension only (cellWidth or cellHeight)
        loadsHorizontally: false)           ///❗️if loadsHorizontally is true, 'rows' look like columns & vice versa (table is transposed)

var budgetVC = CollectionVC(.budgetVC, backgroundColor: globalWindow.backgroundColor!,
                            buttonColorIndex: 3, collectionViewLayout: budgetLayout)

let zeroFrame = CGRect(x: 0, y: 0, width: 0, height: 0) /// initial value for testing

