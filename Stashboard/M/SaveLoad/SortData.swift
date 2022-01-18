import UIKit    //  SortData.swift

extension CollectionVC {
    
    func sortCellData() {
        let sortedSavedDataIndexPaths = savedDataIndexPaths.sorted(by: {cellQueueNumber(from: $0) < cellQueueNumber(from: $1)})
        let sortingTransform = findSortingTransform(savedDataIndexPaths, output: sortedSavedDataIndexPaths)
        savedDataStringArrays = applySortingTransform(savedDataStringArrays, transform: sortingTransform)
            as? [[String]] ?? savedDataStringArrays /// if the sort fails, downcast default value is the original array
        savedDataIndexPaths = sortedSavedDataIndexPaths
    }
    
    func findSortingTransform(_ input: [[Int]], output: [[Int]]) -> [Int] { /// Only called on index-path array here (index paths are unique)...
        var transform = [Int]()                                             /// ...so there is no duplication with firstIndex(of:) in the loop
        
        for element in input {
            transform.append(output.firstIndex(of: element)!)
        }
        return transform
    }
    
    func applySortingTransform(_ input: [Any], transform: [Int]) -> [Any] {
        var output = [Any]()
        var i = 0
        
        for _ in input {
            output.append(0)
        }
        
        for element in input {
            ///let i = output.firstIndex(of: element)! //* using this method would not handle duplication. Need index integer. See comment above...
            if i < transform.count {
                //print("inserting \(element) \nat i=\(i)\ntransform count: \(transform.count)")
                if transform[i] < output.count {
                    output[transform[i]] = element
                }
            }
            if i < transform.count - 1 {i += 1}
        }
        return output
    }
}

