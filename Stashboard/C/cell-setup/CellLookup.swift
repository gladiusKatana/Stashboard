import UIKit    //  CellLookup.swift

extension CollectionVC {
    
    func cellLookup(from paths: [(Int,Int,Int)], prynting: Bool) -> [Double] {/// input triplets represent extended index paths (vc,column,row)  /// vc = view controller number
        
        //print("\nlooking up value from paths \(paths)")
        
        let n = 0.0
        var returnValues = [n,n,n,n,n,n] /// array length must be = paths.length (=largest set of numerical inputs this method will be called with)
        
        var i = 0
        
        for path in paths {
            
            if let data = dataAtIndexPath[CellStruct(values:(path.0, path.1, path.2))],
               !data.isEmpty {
                
                if let dblStr = Double(data.last!) {
                    //print("getting return value \(i)")
                    returnValues[i] = dblStr
                }
                else {print("NO CONVERSION AT \(path)")}
                
            }
            //else {print("NO DATA AT \(path)")}
            
            i += 1
        }
        
        if prynting {print("Found values \(returnValues) at cells \(paths)")}
        
        return returnValues
    }
    
}

