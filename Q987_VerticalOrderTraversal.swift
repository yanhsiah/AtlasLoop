//
//  Q987_VerticalOrderTraversal.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class Solution {
    
    // time: O(NlogN), space: O(N)
    typealias Cache = [Int: [Int: [Int]]]
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var cache = Cache()
        dfs(&cache, root, 0, 0)
        
        var res = [[Int]]()
        for x in cache.keys.sorted() {
            guard let cols = cache[x] else { continue }
            var col = [Int]()
            for y in cols.keys.sorted() {
                guard let nodes = cols[y] else { continue }
                col += nodes.sorted()
            }
            res.append(col)
        }
        return res
    }
    func dfs(_ cache: inout Cache, _ node: TreeNode?, _ x: Int, _ y: Int) {
        guard let node = node else { return }
        cache[x, default: [Int: [Int]]()][y, default: [Int]()].append(node.val)
        dfs(&cache, node.left, x-1, y+1)
        dfs(&cache, node.right, x+1, y+1)
    }
}
