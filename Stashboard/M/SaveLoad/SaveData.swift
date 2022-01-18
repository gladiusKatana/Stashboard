import UIKit    //    CoinBits Calculator    SaveData.swift    prototype    created by Garth Snyder

import SwiftKeychainWrapper


extension CollectionVC {
    
    func saveDataToKeychain(saveDate: Bool, resetSavedDataDate: Bool, showDate: Bool, pryntData: Bool) {  ///print("default save")
        
        if showDate {pryntDate(Date(), prefix: "\n                  ✔︎saved")}
        
        savedDataIndexPaths.removeAll()
        savedDataStringArrays.removeAll()
        
        for key in dataAtIndexPath.keys {
            let (a, b, c) = key.values ///; print("key: [\(key)  values \((a, b, c))")
            savedDataIndexPaths.append([a, b, c])
            ///let qNum = cellQueueNumber(from: [a,b,c])      ; print("key: [\(key)  rank \(qNum)")    // for demo purposes
        }
        
        for vals in dataAtIndexPath.values {
            if vals.count >= 1 {
                var dataDescriptions = [String]()
                
                for str in vals {
                    dataDescriptions.append(str)
                }
                
                savedDataStringArrays.append(dataDescriptions)
            }
        }
        
        sortCellData()
        
        setKeychainKeys(savedDataIndexPaths, forKey: keychainStrings[0])
        
        setKeychainKeys(savedDataStringArrays, forKey: keychainStrings[1])
        
        if saveDate {saveComponentsAndDateOfWhenDataModelWasLastSaved(resetting: resetSavedDataDate)}
        if pryntData {pryntDataTabularized()}
    }
}

