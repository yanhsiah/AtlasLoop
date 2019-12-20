//
//  Q124_BinaryTreeMaxPathSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class BinaryTreeMaxPathSum {
    // time: O(N), space: O(H)
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = Int.min
        maxGain(root, &res)
        return res
    }
    func maxGain(_ node: TreeNode?, _ maxSum: inout Int) -> Int{
        guard let node = node else { return 0 }
        
        let left = max(maxGain(node.left, &maxSum), 0)
        let right = max(maxGain(node.right, &maxSum), 0)
        maxSum = max(maxSum, left + node.val + right)
        
        return node.val + max(left, right)
    }
}
