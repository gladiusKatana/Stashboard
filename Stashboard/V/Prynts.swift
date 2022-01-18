import UIKit    //  Prynts.swift

func pryntDataTabularized() {    /// spelling 'prynt' with a y so this function's existence won't hijack Xcode autocomplete priority for print statements
    print("")
    let gap = " "
    var i = 0
    var vcTracker = 0
    
    if savedDataIndexPaths.isEmpty { print("[no data]") }
    
    for path in savedDataIndexPaths {
        
        guard let values = dataAtIndexPath[CellStruct(values:(path[0], path[1], path[2]))] else {print("no data"); return}
        var j = 0
        
        for value in values {
            
            let pathString = "\(path[0]),\(path[1]),\(path[2])"
            let maxPathString = "1,10,99 "///somewhat arbitrary, depends on Xcode console width; will depend on number of rows & columns in view controller
            let excess = String(repeating: " ", count: maxPathString.count - "\(pathString)".count)
            let spaces = String(repeating: " ", count: maxPathString.count - 2)
            
            let restOfString = "\(excess)\(gap)\(gap)\(gap)\(value)"
            let cmma = (j < values.count - 1 && values.count > 1) ? "," : ""
            
            if i == 0 { print("\npath*    string(s)    * path = cell index path (column,row)\n") }
            if path[0] > vcTracker {
                print("-------------------------------------------------------------")
                vcTracker = path[0]
            }
            
            if j == 0  {
                print("\(pathString)\(restOfString)\(cmma)")
            } else {print("\(spaces)\(restOfString)\(cmma)")}
            
            j += 1
        }
        i += 1
    }
    if !(savedDataIndexPaths.isEmpty) {print("")}
}

func pryntDate(_ date: Date, prefix: String) {
    print(formattedDateString(date, roundDown: false, showYear: true, prefix: prefix, suffix: "", dateFormat: .fullDay))
}

