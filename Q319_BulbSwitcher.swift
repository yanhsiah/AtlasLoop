//
//  Q319_BulbSwitcher.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class BulbSwitcher {
    /*
        6th bulb will be toggled at 1,2,3,6
        12th buld will be toggled at 1,2,3,4,6,12
        On: # toggle is odd
        # toggle = # factors of i
        if i is perfect square, it's # factors is odd
        => how many perfect square nums in [1...n]
     */
    // time: O(N^0.5), space: O(1)
    func bulbSwitch(_ n: Int) -> Int {
        return Int(Double(n).squareRoot())
    }
}
