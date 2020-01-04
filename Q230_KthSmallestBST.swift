//
//  Q230_KthSmallestBST.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class KthSmallestBST {
    
    // inorder traversal and returns nums[k-1]: O(N)
    // inorder iterative
    // time: O(H+K), space: O(H)
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var root = root, stk = [TreeNode](), k = k
        while root != nil || !stk.isEmpty {
            if root != nil {
                stk.append(root!)
                root = root!.left
            } else {
                k -= 1
                if k == 0 { return stk.last!.val }
                root = stk.removeLast().right
            }
        }
        return -1
    }
}
