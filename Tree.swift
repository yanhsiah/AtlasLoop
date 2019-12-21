//
//  Tree.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Node {
    var val: Int
    var children: [Node?]
    init(_ val: Int, _ children: [Node?]) {
        self.val = val
        self.children = children
    }
}
