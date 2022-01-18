import UIKit    //  Keyboard.swift

func resetKeyboardHeight() {
    if keyboardSizeFindingMode { /// for determining device's screen sizes empirically (since values seem not to be anywhere online... see comments in Vars.swift) :
        if textFieldDisplayed {
            if currentOrientation == .portrait
                && firstPortraitKeyboardPresented
            {
                keyboardHeight = portraitKeyboardHeight     // could cache these device-and-orientation-specific heights...
            }                                               //...in UserDefaults, saving them for next launch
            
            if currentOrientation == .landscape
                && firstLandscapeKeyboardPresented
            {
                keyboardHeight = landscapeKeyboardHeight
            }
        }
    } else {
        if currentOrientation == .portrait {
            keyboardHeight = portraitKeyboardHeight         // could cache these device-and-orientation-specific heights...
        }                                                   //...in UserDefaults, saving them for next launch
        else {
            keyboardHeight = landscapeKeyboardHeight
        }
        //print("(resetKeyboardHeight()) keyboard height is \(keyboardHeight))")
    }
}

func getKeyboardHeights(forDevice device: String) -> (CGFloat,CGFloat) {
    var portraitHeight = CGFloat(0)
    var landscapeHeight = CGFloat(0)
    let simString = device.contains("Simulator") ? "Simulator " : ""
    
    switch device {
    
    case "\(simString)iPad (8th gen)":                  portraitHeight = 350; landscapeHeight = 438
    case "\(simString)iPad Air (4th gen)":              portraitHeight = 367; landscapeHeight = 452
    case "\(simString)iPad Pro (9.7-inch)":             portraitHeight = 350; landscapeHeight = 438
    case "\(simString)iPad Pro (11-inch)(2nd gen)":     portraitHeight = 370; landscapeHeight = 458
    case "\(simString)iPad Pro (12.9-inch)(4th gen)":   portraitHeight = 433; landscapeHeight = 528
    //case "\(simString)":   portraitHeight = _; landscapeHeight = _
    case "\(simString)iPad Mini 4":                     portraitHeight = 320; landscapeHeight = 408
    case "\(simString)iPhone 7":                        portraitHeight = 216; landscapeHeight = 162
    case "\(simString)iPhone 8":                        portraitHeight = 246; landscapeHeight = 192
    case "\(simString)iPhone 8 Plus":                   portraitHeight = 331; landscapeHeight = 201
    case "\(simString)iPhone 11":                       portraitHeight = 321; landscapeHeight = 201
    case "\(simString)iPhone 11 Pro":                   portraitHeight = 331; landscapeHeight = 201
    case "\(simString)iPhone 11 Pro Max":               portraitHeight = 246; landscapeHeight = 192
    case "\(simString)iPhone 12":                       portraitHeight = 321; landscapeHeight = 211
    case "\(simString)iPhone SE (2nd-gen)":             portraitHeight = 246; landscapeHeight = 192
    case "\(simString)iPod Touch (7th-gen)":            portraitHeight = 246; landscapeHeight = 192
        
    default: portraitKeyboardHeight = 600; landscapeKeyboardHeight = 600
    } //; print("keyboard heights are \(portraitHeight) and \(landscapeHeight)")
    
    return (CGFloat(portraitHeight), CGFloat(landscapeHeight))
}

