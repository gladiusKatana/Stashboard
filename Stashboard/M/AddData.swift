import UIKit    //  AddData.swift

extension CollectionVC {
    
    func addDataAtCell(withColumn column: Int, withRow row: Int,
                       textEntered: String, appendable: Bool) {   //print("adding a value to a cell")
        
        let cellStruct = CellStruct(values:(vcInt, column, row))
        
        if appendable {
            
            if dataAtIndexPath[cellStruct] != nil {
                dataAtIndexPath[cellStruct]!.append(textEntered)
            }
            
            else {
                dataAtIndexPath[cellStruct] = [textEntered]
            }
        }
        
        else {
            dataAtIndexPath[cellStruct] = [textEntered]
        }
        
        /// optional save to keychain each time new data is added
        saveDataToKeychain(saveDate: true, resetSavedDataDate: true, showDate: false, pryntData: false)
    }
}

