import UIKit    //  CellSize.swift

extension CustomFlowLayout {
    
    func calculateCellSize() -> (CGFloat, CGFloat) {                           //print("resizing cells")
        var cellWd = CGFloat(0); var cellHt = CGFloat(0)
        navBarHeight = Double((navController?.navigationBar.frame.height)!) //; print("nav bar height: \(navBarHeight)")
        statusBarHeight = Double((globalWindow.windowScene?.statusBarManager!.statusBarFrame)!.height)
        
        var frame: CGRect
        if embeddedInNavController {
            frame = globalWindow.frame
        } else {
            if let safeFrame = customFrame {
                frame = safeFrame
            } else {frame = zeroFrame       ; print("\ncell sizing error: nil-frame used to size cells; vc has \(rows) rows")}
            ///* default frame is overridden anyway, hence initialization with all 0's
        }
        
        let bottomGap = CGFloat(0) /// extra gap for aesthetics/testing
        let barsHeight = embeddedInNavController ? navBarHeight + statusBarHeight : 0
        let autofitWidth = frame.width / CGFloat(cols - autofitOverhangColumns) - hSpace
        let h = frame.height - bottomGap
        let autoFitHeight = (h - CGFloat(barsHeight)) / CGFloat(rows - autofitOverhangRows) - vSpace
        
        headerHeightFactor = 0.5            //; print("header height factor is \(headerHeightFactor)")
        
        let regularRows = CGFloat(rows - lockedHeaderRows)
        cellHeightIncrease = (CGFloat(1) - headerHeightFactor) * CGFloat(lockedHeaderRows) / (regularRows - CGFloat(autofitOverhangRows))
        cellHeightFactor = CGFloat(1) + cellHeightIncrease
        let updatedHeightPlusSpace = heightPlusSpace * cellHeightFactor
        textFieldHeight = updatedHeightPlusSpace
        
        switch cellDimensionsMode {
        case .widthAndHeightHardcoded:  cellWd = cellWidth!;                        cellHt = cellHeight!
        case .widthHardcoded:           cellWd = cellWidth!;                        cellHt = autoFitHeight * autoFitHeightScale!
        case .heightHardcoded:          cellWd = autofitWidth * autoFitWScale!;     cellHt = cellHeight!
        case .noHardcoding:             cellWd = autofitWidth * autoFitWScale!;     cellHt = autoFitHeight * autoFitHeightScale!
        }
        return (cellWd, cellHt)
    }
}

