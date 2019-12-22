//
//  Q543_DiameterBT.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

// Q124_BinaryTreeMaxPathSum

class Solution {
    
    // time: O(N), space: O(H)
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 1
        dfs(root, &res)
        return res - 1
    }
    func dfs(_ node: TreeNode?, _ count: inout Int) -> Int {
        guard let node = node else { return 0 }
        
        let left = dfs(node.left, &count)
        let right = dfs(node.right, &count)
        count = max(count, left + 1 + right)

        return 1 + max(left, right)
    }
}
