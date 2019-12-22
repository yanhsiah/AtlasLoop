//
//  Q173_BSTIterator.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class BSTIterator {
    
    var stk = [TreeNode]()
    private func getS(_ node: TreeNode?) {
        var node = node
        while node != nil {
            stk.append(node!)
            node = node!.left
        }
    }

    init(_ root: TreeNode?) {
        getS(root)
    }

    // time: average O(1)
    func next() -> Int {
        guard let res = stk.last?.val else { return 0 }
        getS(stk.removeLast().right)
        return res
    }
    
    // time: O(1)
    func hasNext() -> Bool {
        return !stk.isEmpty
    }
}
