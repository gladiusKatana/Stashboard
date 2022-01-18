import UIKit    //    CoinBits Calculator    TestSquare.swift    prototype    created by Garth Snyder

func drawTestSquare() { /// for testing purposes only: to verify dynamic calculation of navbar height + status bar height, and thus, cell heights

    let size = 8.0
    
    testSquarelayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: statusBarHeight + navBarHeight,
                                                            width: size, height: size), cornerRadius: 0).cgPath
    
    testSquarelayer.fillColor = testSquareColorInt % 2 == 0
        ? UIColor.lightGray.cgColor
        : UIColor.white.cgColor//testSquareColors[testSquareColorInt]
    
    testSquareColorInt += 1
    
    globalWindow.layer.addSublayer(testSquarelayer)
    
    //print("drawing test square")
    //print("drawing test square with color \(testSquarelayer.fillColor!) @ (\(statusBarHeight + navBarHeight)\n")
}


public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    
    let length = Int64(range.upperBound - range.lowerBound + 1)
    
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    
    return T(value)
}

