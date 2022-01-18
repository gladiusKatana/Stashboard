import UIKit    //    CoinBits Calculator    FormatDate.swift    prototype    created by Garth Snyder

func formattedDateString(_ date: Date, roundDown: Bool, showYear: Bool, prefix: String?, suffix: String, dateFormat: CustomDateFormat) -> String { // * probably will remove some of this method at some point (ie enum cases)
    
    let (year, _, month, mnth, day, weekday, wkdy, hour, minute, second) = getChosenDateComponents(date, roundedDown: roundDown)
    var ampm = ""
    var minTwoDigits = "\(minute)";             if minute < 10 {minTwoDigits = "0\(minute)"}
    var sec2Digs = "\(second)";                 if second < 10 {sec2Digs = "0\(second)"}
    var hr = (hour < 13) ? hour : hour - 12
    let prx = (prefix == "") ? " " : "\(prefix ?? "") "
    
    if hr == 0 {hr = 12}                            /// this is just to make a string representing the date, not the date itself
    if hour < 12 {ampm = "am"} else {ampm = "pm"}   /// since hr is an integer from 0 to 23
    let yearString = showYear && ["January", "December"].contains(month) ? ", \(year)" : ""
    
    switch dateFormat {
    case .monthAndDay:              return "\(prx)\(month.prefix(3)) \(day)"
    case .monthAndDayNoPrefix:      return "\(month.prefix(3)) \(day)"
    case .fullDay:                  return "\(prx)\(weekday) \(month) \(day)\(yearString), \(hr):\(minTwoDigits)\(ampm)\(suffix)"
    case .fullDayWithYear:          return "\(prx)\(weekday) \(month) \(day), \(year) \(hr):\(minTwoDigits)\(ampm)\(suffix)"
        
    case .fullDayWithSeconds:       return "\(prx)\(weekday) \(month) \(day)\(yearString)\(hr):\(minTwoDigits):\(sec2Digs)\(ampm)\(suffix)"
        
    case .fullDayShortForm:         return "\(prx)\(wkdy) \(mnth) \(day)\(yearString), \(hr)\(ampm)\(suffix)"
    case .fullDayShortWithMins:     return "\(prx)\(wkdy) \(mnth) \(day)\(yearString), \(hr):\(minTwoDigits)\(ampm)\(suffix)"
        
    case .fullDayShortFormNoDots:   return "\(prx)\(weekday.prefix(3)) \(month.prefix(3)) \(day)\(yearString), \(hr)\(ampm)\(suffix)"
        
    case .hourOnly:                 return "\(hr)\(ampm)"
    case .hourAndMinute:            return " \(hr):\(minTwoDigits)\(ampm)"
    case .hourAndMinuteNewlined:    return "\n  \(hr):\(minTwoDigits)\n   \(ampm)"
    default:                        return "\(sec2Digs)" /// seconds
    }
}

enum CustomDateFormat: Int {
    case fullDay = 0; case fullDayWithYear, fullDayWithSeconds, fullDayShortForm, fullDayShortWithMins, fullDayShortFormNoDots, archiveFormat, archiveCSVTitle, hourOnly, hourAndMinute, hourAndMinuteNewlined, monthAndDay, monthAndDayNoPrefix, second
}

