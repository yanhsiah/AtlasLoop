//
//  Q314_BTVerticalOrderTraversal.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

// 987

class BTVerticalOrderTraversal {
    
    // time: O(N), space: O(N)
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var start = 0, end = 0
        var nodes = [(Int, Int)]() // (x, val)
        var q = [(root, 0)]
        while !q.isEmpty {
            var nq = [(TreeNode, Int)]()
            for (node, x) in q {
                start = min(start, x)
                end = max(end, x)
                nodes.append((x, node.val))
                if let left = node.left { nq.append((left, x-1)) }
                if let right = node.right { nq.append((right, x+1)) }
            }
            swap(&nq, &q)
        }

        var res = Array(repeating: [Int](), count: end - start + 1)
        for (x, val) in nodes { res[x-start].append(val) }
        return res
    }
}
