import UIKit    //  StringFormatting.swift

extension String { //* refactor some of these methods at some point soon
    
    func removeCharacters(beforeOrAfter character: String, after: Bool) -> String {
        let string = self
        var returnString = self
        
        if let range = string.range(of: character) {
            
            let firstPart = string[string.startIndex..<range.lowerBound]
            var secondPart = string[range.lowerBound..<string.endIndex]
            secondPart.removeFirst()
            
            returnString = after ? String(firstPart) : String(secondPart)
        }
        return returnString
    }
    
    func formatDollarsAndCentsDecimals(testPrynt:Bool) -> String {
        var mutableSelf = self
        if mutableSelf.contains(".") {
            let charsAfterDot = self.removeCharacters(beforeOrAfter: ".", after: false) // RETURNS characters after decimal
            if testPrynt{print("chars after dot: \(charsAfterDot)")}
            
            if charsAfterDot.count == 1 {
                if charsAfterDot == "0" {
                    mutableSelf = mutableSelf.removeCharacters(beforeOrAfter: ".", after: true)
                } else {mutableSelf.append("0")}
            }
        }
        return mutableSelf
    }
}

extension Double {
    func doubleRepresentedWithCommas() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        var formattedDoubleString = numberFormatter.string(from: NSNumber(value: self))
        formattedDoubleString = formattedDoubleString?.formatDollarsAndCentsDecimals(testPrynt: false)
        return formattedDoubleString
    }
}

// probably move this method
extension CollectionVC {
    func formatAndSetTitleLabel(_ result: Double) -> String {
        let formattedDoubleString = result.doubleRepresentedWithCommas()
        return formattedDoubleString != nil ? formattedDoubleString! : "-"
    }
}

