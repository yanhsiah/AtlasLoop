//
//  Q637_AvgLevelsBT.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class AvgLevelsBT {
    
    // time: O(N), space: O(N)
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var res = [Double](), q = [root]
        while !q.isEmpty {
            var nq = [TreeNode](), sum = 0
            for node in q {
                sum += node.val
                if let left = node.left { nq.append(left) }
                if let right = node.right { nq.append(right) }
            }
            res.append(Double(sum) / Double(q.count))
            swap(&q, &nq)
        }
        return res
    }
}
