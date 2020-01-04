//
//  Q701_InsertBST.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class InsertBST {
    // time: O(H), space: O(1)
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        let node = TreeNode(val)
        guard var ptr = root else { return node }
        while true {
            if (val < ptr.val) {
                if let left = ptr.left { ptr = left }
                else { ptr.left = node; break }
            } else {
                if let right = ptr.right { ptr = right }
                else { ptr.right = node; break }
            }
        }
        return root
    }
}
