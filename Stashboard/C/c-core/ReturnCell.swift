import UIKit    //  ReturnCell.swift

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row; let col = indexPath.section
        let layout = customFlowLayout!; let cols = layout.cols; let overhangCols = layout.autofitOverhangColumns
        
        if selectedIndexPath[0] == lastNonOverhangColumn && selectedIndexPath[1] == 1 {
            willUpdateSelectedIndexPathUponRotation = true
        }
        
        lastNonOverhangColumn = cols - overhangCols - 1
        
        if willUpdateSelectedIndexPathUponRotation {
            selectedIndexPath[0] = lastNonOverhangColumn
            willUpdateSelectedIndexPathUponRotation = false
        }
        
        if [lastNonOverhangColumn, cols - 1].contains(col) && [0,1].contains(row) { /// Note, we have some extra (unused) right-justified rows here
            return registerRightCell(collectionView, at: indexPath, lastNonOverhangColumn: lastNonOverhangColumn)
        } else {return registerCenterCell(collectionView, at: indexPath)}
    }
    
    func registerCenterCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CenterAlignedCell {
        collectionView.register(CenterAlignedCell.self, forCellWithReuseIdentifier: CenterAlignedCell.reuseIdentifier)
        var centerCell = collectionView.dequeueReusableCell(withReuseIdentifier: CenterAlignedCell.reuseIdentifier,
                                                        for: indexPath) as! CenterAlignedCell
        centerCell = centerCellSetup(cell: centerCell, indexPath: indexPath)
        return centerCell
    }
    
    func registerRightCell(_ collectionView: UICollectionView, at indexPath: IndexPath,
                           lastNonOverhangColumn: Int) -> RightAlignedCell {
        collectionView.register(RightAlignedCell.self, forCellWithReuseIdentifier: RightAlignedCell.reuseIdentifier)
        var rightCell = collectionView.dequeueReusableCell(withReuseIdentifier: RightAlignedCell.reuseIdentifier,
                                                        for: indexPath) as! RightAlignedCell
        rightCell = rightCellSetup(rightCell, indexPath: indexPath, layout: customFlowLayout!,
                                   lastNonOverhangColumn: lastNonOverhangColumn)
        return rightCell
    }
    
    /*
     
     func registerCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CustomCell {
     collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
     var cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
     cell = multiLineCellSetup(cell: cell, indexPath: indexPath)
     //cell.layer.cornerRadius = indexPath.row >= customFlowLayout!.lockedHeaderRows ? 4 : 0
     return cell
     }
     
     func registerLeftCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> LeftAlignedCell {
     collectionView.register(LeftAlignedCell.self, forCellWithReuseIdentifier: LeftAlignedCell.reuseIdentifier)
     var leftCell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftAlignedCell.reuseIdentifier, for: indexPath) as! LeftAlignedCell
     leftCell = rightCellSetup(cell: leftCell, indexPath: indexPath) /// write a left equivalent of this method
     return leftCell
     }
     
     */
}

