//
//  Q199_BTRightView.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class BTRightView {
    // time: O(N), space: O(H)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        dfs(&res, root, 0)
        return res
    }
    func dfs(_ res: inout [Int], _ node: TreeNode?, _ depth: Int) {
        guard let node = node else { return }
        if depth == res.count { res.append(node.val) }
        dfs(&res, node.right, depth + 1)
        dfs(&res, node.left, depth + 1)
    }
}
