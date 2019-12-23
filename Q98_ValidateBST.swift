//
//  Q98_ValidateBST.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class ValidateBST {
    // time: O(N), space: O(H)
    func isValidBST(_ root: TreeNode?) -> Bool {
        var prev: Int?
        var root = root
        var stk = [TreeNode]()
        while root != nil || !stk.isEmpty {
            if root != nil {
                stk.append(root!)
                root = root!.left
            } else {
                let curr = stk.last!.val
                if prev != nil && prev! >= curr { return false }
                prev = curr
                root = stk.removeLast().right
            }
        }
        return true
    }
}
