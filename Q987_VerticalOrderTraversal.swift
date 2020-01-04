//
//  Q987_VerticalOrderTraversal.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

// 314

class VerticalOrderTraversal {
    
    // If two nodes have the same position, the value of the node
    // that is reported first is the value that is smaller.
    // time: O(NlogN), space: O(N)

    // typealias Cache = [Int: [Int: [Int]]]
    var cache = [Int: [Int: [Int]]]() // [x: y: [val]]
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        dfs(root, 0, 0)
        
        var res = [[Int]]()
        for x in cache.keys.sorted() {
            guard let cols = cache[x] else { continue }
            var vals = [Int]()
            for y in cols.keys.sorted() {
                guard let nodes = cols[y] else { continue }
                vals += nodes.sorted()
            }
            res.append(vals)
        }
        return res
    }
    func dfs(_ node: TreeNode?, _ x: Int, _ y: Int) {
        guard let node = node else { return }
        cache[x, default: [:]][y, default: []].append(node.val)
        dfs(node.left, x-1, y+1)
        dfs(node.right, x+1, y+1)
    }
}
