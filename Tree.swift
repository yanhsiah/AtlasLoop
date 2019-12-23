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

let one = TreeNode(1)
one.left = TreeNode(3); one.right = TreeNode(4)
let two = TreeNode(2)
two.left = TreeNode(5); two.right = TreeNode(6)
let root = TreeNode(0)
root.left = one; root.right = two

func preorder(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var root = root
    var stk = [TreeNode]()
    while root != nil || !stk.isEmpty {
        if root != nil {
            stk.append(root!)
            res.append(stk.last!.val)       // M
            root = root!.left               // L
        } else {
            root = stk.removeLast().right   // R
        }
    }
    return res
}

func inorder(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var root = root
    var stk = [TreeNode]()
    while root != nil || !stk.isEmpty {
        if root != nil {
            stk.append(root!)
            root = root!.left               // L
        } else {
            res.append(stk.last!.val)       // M
            root = stk.removeLast().right   // R
        }
    }
    return res
}

func postorder(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var root = root
    var stk = [TreeNode]()
    while root != nil || !stk.isEmpty {
        if root != nil {
            stk.append(root!)
            res.append(stk.last!.val)       // M
            root = root!.right              // R
        } else {
            root = stk.removeLast().left    // L
        }
    }
    res.reverse() // LRM
    return res
}

func LCA(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
    if root == nil || root === p || root === q { return root }
    let left = LCA(root!.left, p, q)
    let right = LCA(root!.right, p, q)
    if left != nil && right != nil { return root }
    return left ?? right
}

//       1
//      / \
//     2   3
//    / \ / \
//   4  5 6  7

print(preorder(root))   // [0, 1, 3, 4, 2, 5, 6]
print(inorder(root))    // [3, 1, 4, 0, 5, 2, 6]
print(postorder(root))  // [3, 4, 1, 5, 6, 2, 0]

print(String(describing: LCA(root, two.right!, one.left!)?.val))
// Optional(0)
