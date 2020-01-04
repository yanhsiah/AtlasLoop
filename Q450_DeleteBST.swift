//
//  Q450_DeleteBST.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class DeleteBST {
    
    // time & space: O(H) 
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        if key < root.val { root.left = deleteNode(root.left, key) }
        else if key > root.val { root.right = deleteNode(root.right, key) }
        else {
            if root.left == nil && root.right == nil { return nil }
            else if let left = root.left {
                root.val = predecessor(left)
                root.left = deleteNode(left, root.val)
            }
            else if let right = root.right {
                root.val = successor(right)
                root.right = deleteNode(right, root.val)
            }
        }
        return root
    }
    
    func predecessor(_ left: TreeNode) -> Int {
        var ptr = left
        while let right = ptr.right { ptr = right }
        return ptr.val
    }
    func successor(_ right: TreeNode) -> Int {
        var ptr = right
        while let left = ptr.left { ptr = left }
        return ptr.val
    }
}
