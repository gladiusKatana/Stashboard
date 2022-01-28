import UIKit    //  Keychain.swift

import SwiftKeychainWrapper     // see https://github.com/jrendel/SwiftKeychainWrapper ; search "Swift Package Manager"

func setKeychainKeys(_ inputVar: Any, forKey keyString: String) {   //print("setting keychain keys")
    
    do {
        
        let data = try NSKeyedArchiver.archivedData(withRootObject: inputVar, requiringSecureCoding: true)
        
        KeychainWrapper.standard.set(data, forKey: keyString)
        
        /*let saveSuccessful: Bool
         = KeychainWrapper.standard.set(data, forKey: keyString)
         print("Successfully saved to keychain? \(saveSuccessful)")*/
        
    } catch {
        print("Error setting keychain keys")
    }
}


func loadKeychainFromKeys(_ keyString: String) -> NSArray {
    
    var returnArray = NSArray()
    
    if let data = KeychainWrapper.standard.data(forKey: keyString)
    {
        do {
            let arrayFromData = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: data)!
            returnArray = arrayFromData
        }
        catch {
            print("Error loading from keychain keys")
        }
    }
    
    return returnArray
}

/*
 
 from:
 https://github.com/jrendel/SwiftKeychainWrapper
 
 "
 Swift Package Manager
 You can use Swift Package Manager to install SwiftKeychainWrapper using Xcode:

 Open your project in Xcode
 Click "File" -> "Swift Packages" -> "Add Package Dependency..."
 Paste the following URL: https://github.com/jrendel/SwiftKeychainWrapper
 Click "Next" -> "Next" -> "Finish"
 "
 
 -jrendel
 
 */
