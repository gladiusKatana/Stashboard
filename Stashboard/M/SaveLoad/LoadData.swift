import UIKit    //  LoadData.swift
import SwiftKeychainWrapper

extension CollectionVC {
    
    func loadDataFromKeychain(showDate: Bool) {  //print("default load")
        
        savedDataIndexPaths = loadKeychainFromKeys(keychainStrings[0]) as? [[Int]] ?? []
        
        savedDataStringArrays = loadKeychainFromKeys(keychainStrings[1]) as? [[String]] ?? []
        
        
        if let components = loadKeychainFromKeys(keychainStrings[2]) as? [Any] {
            
            lastSavedDataDateComponents = components
            dateLastSavedData = dateFromComponents(lastSavedDataDateComponents)
            
            if showDate {
                pryntDate(dateLastSavedData, prefix: "last saved              ")
                //pryntDate(Date(), prefix: "date right now          ")
            }
            
        } else {
            
            print("\nfirst time logging on; saving date-and-time")
            
            let (year, _, month, _ , day, weekday, _, hour, minute, _)
                = getChosenDateComponents(Date(), roundedDown: true)
            
            lastSavedDataDateComponents = [year, month, day, weekday, hour, minute]
        }
        
        
        populateCellDictionary() //; print("\nloaded \(savedDataIndexPaths.count) data paths: \(savedDataIndexPaths)\n")
        
    }
    
}

