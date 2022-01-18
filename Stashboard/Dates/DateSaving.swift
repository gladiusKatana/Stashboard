import UIKit    //    CoinBits Calculator    DateSaving.swift    prototype    created by Garth Snyder


func saveComponentsAndDateOfWhenDataModelWasLastSaved(resetting: Bool) {
    
    /// yup - long function name but only to avoid semantic confusion. Plus, it's only called once
    
    
    let (year, _, month, _ , day, weekday, _, hour, minute, _) = getChosenDateComponents(Date(), roundedDown: false)
    
    lastSavedDataDateComponents = [year, month, day, weekday, hour, minute]
    
    if resetting {dateLastSavedData = dateFromComponents(lastSavedDataDateComponents)}
    
    setKeychainKeys(lastSavedDataDateComponents, forKey: keychainStrings[2])
    
}

