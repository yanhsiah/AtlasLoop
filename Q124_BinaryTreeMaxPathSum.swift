//
//  Q124_BinaryTreeMaxPathSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

// Q543_DiameterBT

class BinaryTreeMaxPathSum {
    // maxGain
    // time: O(N), space: O(H)
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = Int.min
        dfs(root, &res)
        return res
    }
    func dfs(_ node: TreeNode?, _ sum: inout Int) -> Int {
        guard let node = node else { return 0 }
        
        let left = max(dfs(node.left, &sum), 0)
        let right = max(dfs(node.right, &sum), 0)
        sum = max(sum, left + node.val + right)
        
        return node.val + max(left, right)
    }
}
