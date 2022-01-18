import UIKit    //    CoinBits Calculator    VCs_II.swift    prototype    created by Garth Snyder

let expensesBreakdownLayout = CustomFlowLayout(
    embeddedInNavController: true,      ///  if true, it's fullscreen (with a nav bar button to navigate to its collection view controller's view); ...
    ///                                  ... if false, it's a window with a custom frame (frame is set prior to presenting the view controller)
    customFrame: nil,                   ///  if nil, it defaults to the app's window frame (as when embeddedInNavController = true)
    rows: rowsPerView, cols: 7,
    lockedHeaderRows: headerRows, lockedHeaderSections: 1,
    cellWidth: nil, cellHeight: nil,    /// if either is nil, screen width and/or height auto-fitted (else, auto-fit scalars below ignored, ie set to 1.0)
    autofitOverhangRows: overhangRows,
    autofitOverhangColumns: 0,
    autoFitWScale: 1, autoFitHScale: 1, ///  if either of these parameters are nil, they default to 1.0
    hSpace: gap, vSpace: gap,           ///  gaps between the cells
    squareCellMode: .noAutoSquare,      ///  optional auto-scaling to make cells square, by specifying 1 dimension only (cellWidth or cellHeight)
    loadsHorizontally: false)           ///❗️if loadsHorizontally is true, 'rows' look like columns & vice versa (table is transposed)

var expensesVC = CollectionVC(.expensesVC, backgroundColor: globalWindow.backgroundColor!,
                          buttonColorIndex: 2, collectionViewLayout: expensesBreakdownLayout)

let creditBreakdownLayout = CustomFlowLayout(
    embeddedInNavController: true,      ///  if true, it's fullscreen (with a nav bar button to navigate to its collection view controller's view); ...
    ///                                  ... if false, it's a window with a custom frame (frame is set prior to presenting the view controller)
    customFrame: nil,                   ///  if nil, it defaults to the app's window frame (as when embeddedInNavController = true)
    rows: rowsPerView, cols: 13,
    lockedHeaderRows: headerRows, lockedHeaderSections: 1,
    cellWidth: nil, cellHeight: nil,    /// if either is nil, screen width and/or height auto-fitted (else, auto-fit scalars below ignored, ie set to 1.0)
    autofitOverhangRows: overhangRows,
    autofitOverhangColumns: 8,
    autoFitWScale: 1, autoFitHScale: 1, ///  if either of these parameters are nil, they default to 1.0
    hSpace: gap, vSpace: gap,           ///  gaps between the cells
    squareCellMode: .noAutoSquare,      ///  optional auto-scaling to make cells square, by specifying 1 dimension only (cellWidth or cellHeight)
    loadsHorizontally: false)           ///❗️if loadsHorizontally is true, 'rows' look like columns & vice versa (table is transposed)

var creditVCLayout = creditBreakdownLayout

var creditVC = CollectionVC(.creditVC, backgroundColor: globalWindow.backgroundColor!,
                          buttonColorIndex: 1, collectionViewLayout: creditBreakdownLayout)

