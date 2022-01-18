import UIKit    //    CoinBits Calculator    Colors.swift    prototype    created by Garth Snyder

var headerColor = darkKeyboardColor//74,113,128 //UIColor.darkGray

var defaultBackgroundColor = customNightMode
    ? xcodeDefaultDark
    : headerColor

var defaultColor = customNightMode
    ? xcodeDefaultDark
    : UIColor.white

var defaultCellTextColor = customNightMode
    ? platinum
    : UIColor.black

var cellDefaultColor = defaultColor
var tappedCellColor = OriginalSpreadsheetDark
var headerTextColor = platinum

var z = CGFloat(50)
var OriginalSpreadsheetDark = UIColor.rgb(z, g: z, b: z, a: 1); var xcodeDefaultDark = UIColor.rgb(31, g: 31, b: 36, a: 1)
var headerTappedCellColor = UIColor.rgb(z*2, g: z*2, b: z*2, a: 1); var darkKeyboardColor = UIColor.rgb(40, g: 36, b: 36, a: 1)
var platinum = UIColor.rgb(214, g: 214, b: 214, a: 1);          var semiPlatinum = UIColor.rgb(214, g: 214, b: 214, a: 0.5)
var grayTwo = UIColor.rgb(0, g: 0, b: 0, a: 0.2);               var graySeven = UIColor.rgb(0, g: 0, b: 0, a: 0.7)

var darkRed = UIColor.rgb(150, g: 0, b: 0, a: 1)
///var iosKeyboardDefaultColorApprox = UIColor.rgb(206, g: 213, b: 219, a: 1)        ///b: 218 // (207, g: 212, b: 225, a: 1)
///var xcodeDuskBackground = UIColor.rgb(30, g: 32, b: 60, a: 0.7);                        //var xcodeDuskLight = UIColor.rgb(90, g: 96, b: 120, a: 1)
///var customGray = UIColor.rgb(255, g:255, b: 255, a: 0.03);                                   //var iosSettingsGray = UIColor.rgb(240, g: 240, b: 247, a: 1)
///var greyishBlue = UIColor.rgb(138, g: 176, b: 210, a: 1)
///var gold = UIColor.rgb(113, g: 82, b: 0, a: 0.86);                                                     //var jadeGreen = UIColor.rgb(22, g: 134, b: 79, a: 0.6)

//var testSquareColors = /// used in TestSquare.swift
//    [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.black.cgColor]

extension UIColor {
    static func rgb(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

