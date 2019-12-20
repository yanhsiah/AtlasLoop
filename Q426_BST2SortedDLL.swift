//
//  Q426_BST2SortedDLL.swift
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

class BST2SortedDLL {
    // Inorder traversal
    // time: O(N), space: O(1)
    var head: TreeNode?
    var tail: TreeNode?
    func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        inorder(node.left)
        if let tail = tail {
            tail.right = node
            node.left = tail
        } else {
            head = node
        }
        tail = node
        inorder(node.right)
    }
    func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
        inorder(root)
        if let head = head, let tail = tail {
            head.left = tail
            tail.right = head
        }
        return head
    }
}

var root = TreeNode(4)
root.left = TreeNode(2)
root.left!.left = TreeNode(1)
root.left!.right = TreeNode(3)
root.right = TreeNode(5)
let question = BST2SortedDLL()
var ptr = question.treeToDoublyList(root)
for _ in 0...9 { print(ptr!.val); ptr = ptr!.left }
print("--")
for _ in 0...9 { print(ptr!.val); ptr = ptr!.right }
