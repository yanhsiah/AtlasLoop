//
//  Q102_BTLevelOrderTraversal.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard let root = root else { return res }
        
        var q = [root]
        while !q.isEmpty {
            var nq = [TreeNode]()
            var level = [Int]()
            for node in q {
                level.append(node.val)
                if let left = node.left { nq.append(left) }
                if let right = node.right { nq.append(right) }
            }
            res.append(level)
            swap(&q, &nq)
            
            // res.append(q.map { $0.val })
            // q = q.flatMap { [$0.left, $0.right] }.compactMap { $0 }
        }

        // Q107
        // res.reverse()

        return res
    }
}
