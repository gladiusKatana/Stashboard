import UIKit    //    CoinBits Calculator    SizeEnums.swift    prototype    created by Garth Snyder

extension CustomFlowLayout {
    
    enum CellDimensionsMode: Int {
        
        case widthAndHeightHardcoded = 0
        case widthHardcoded, heightHardcoded, noHardcoding
        
        func simpleDescription() -> String {
            switch self {
            case .widthAndHeightHardcoded:      return "Width and height of the cells are both hardcoded"
            case .widthHardcoded:               return "Width of the cells is hardcoded, height is auto-fitted"
            case .heightHardcoded:              return "Height of the cells is hardcoded, width is auto-fitted"
            case .noHardcoding:                 return "Width and height of the cells are both auto-fitted"
            }
        }
    }
    
    func resetDimensionIfSquareCellsEnabled() {
        switch squareCellMode {
        case .autoSquareWidthFromHeight: cellWidth = cellHeight//cellWd = cellHt
        case .autoSquareHeightFromWidth: cellHeight = cellWidth//cellHt = cellWd
        case .noAutoSquare: break
        }
    }
    
    enum SquareCellMode: Int {
        
        case noAutoSquare = 0
        case autoSquareHeightFromWidth, autoSquareWidthFromHeight
        
        func simpleDescription() -> String {
            switch self {
            case .noAutoSquare:                 return "cells are not auto-resized to be square"
            case .autoSquareHeightFromWidth:    return "cell height is auto-resized to equal cell width"
            case .autoSquareWidthFromHeight:    return "cell width is auto-resized to equal cell height"
            }
        }
    }
}

