import UIKit    //  PopulateModel.swift

extension CollectionVC {
    
    func populateCellDictionary() {
        
        if savedDataStringArrays.isEmpty {
            
            print("no cell contents saved to your keychain for this device")
            
            /// print("cell text array-of-arrays empty, ie its count is \(savedDataStringArrays.count)")
            
        } else {
            
            var i = 0
            
            for path in savedDataIndexPaths {                   //print("path: \(path), description array \(i)")
                
                if i < savedDataStringArrays.count {
                    let dataStrings = savedDataStringArrays[i]
                    var cellStrings = [String]()
                    var j = 0
                    
                    for str in dataStrings {
                        cellStrings.append(str)
                        j += 1
                    }
                    
                    if path.count >= 3 {
                        let cellStruct = CellStruct(values: (path[0], path[1], path[2]))
                        dataAtIndexPath[cellStruct] = cellStrings
                    }
                }
                
                i += 1
            }
        }
    }
}

