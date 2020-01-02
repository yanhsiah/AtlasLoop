//
//  Q938_RangeSumBST.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class RangeSumBST {
    
    // time: O(N), space: O(H)
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard let root = root else { return 0 }
        if root.val < L { return rangeSumBST(root.right, L, R) }
        else if root.val > R { return rangeSumBST(root.left, L, R) }
        else {
            return root.val + rangeSumBST(root.left, L, R) + rangeSumBST(root.right, L, R)
        }
    }
}
