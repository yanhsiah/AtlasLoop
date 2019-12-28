//
//  Q958_CompletenessBT.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class CompletenessBT {
    // level order traversal
    // time: O(N), space: O(N)
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }

        var isEnd = false
        var q = [root]
        while !q.isEmpty {
            var nq = [TreeNode]()
            for node in q {
                if let left = node.left {
                    if isEnd { return false }
                    nq.append(left)
                } else {
                    isEnd = true
                }

                if let right = node.right {
                    if isEnd { return false }
                    nq.append(right)
                } else {
                    isEnd = true
                }
            }
            swap(&nq, &q)
        }
        return true
    }
}
