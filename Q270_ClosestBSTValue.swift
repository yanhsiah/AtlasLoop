//
//  Q270_ClosestBSTValue.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class Solution {
    // time: O(logN), space: O(1)
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else { return -1 }
        var closest = root
        var minDist = abs(Double(closest.val) - target)
        var ptr: TreeNode? = root
        while ptr != nil {
            let val = Double(ptr!.val)
            var dist = abs(val - target)
            if dist < minDist {
                minDist = dist
                closest = ptr!
            }
            ptr = target < val ? ptr!.left : ptr!.right
        }
        return closest.val
    }
}
