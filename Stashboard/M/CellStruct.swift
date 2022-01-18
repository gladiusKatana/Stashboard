import UIKit    //  CellStruct.swift


struct CellStruct<T: Hashable, U: Hashable, V: Hashable>: Hashable {
    
    let values : (T, U, V)
    
    func hash(into hasher: inout Hasher) {
        let (a,b,c) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue &* 31 &+ c.hashValue)
    }
    
}


func == <T:Hashable,U:Hashable,V:Hashable> (lhs: CellStruct<T,U,V>,
                                            rhs: CellStruct<T,U,V>)
-> Bool {                                               /// comparison function for conforming to Equatable protocol
    
    return lhs.values == rhs.values
    
}

