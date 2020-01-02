//
//  Q1123_LCADeepestLeaves.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class LCADeepestLeaves {
    
    // time: O(N), space: O(H)
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        return dfs(root).0
    }
    
    func dfs(_ node: TreeNode?) -> (TreeNode?, Int) {
        guard let node = node else { return (nil, 0) }
        let (left, dl) = dfs(node.left)
        let (right, dr) = dfs(node.right)

        if dl > dr { return (left, 1 + dl) }
        if dl < dr { return (right, 1 + dr) }
        return (node, 1 + dl)
    }
}
