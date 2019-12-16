//
//  Q257_BinaryTreePaths.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/15.
//

import Foundation

class BinaryTreePaths {
    /*
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res = [String]()
        dfs(root, "", &res)
        return res
    }
    func dfs(_ node: TreeNode?, _ path: String, _ res: inout [String]) {
        guard let node = node else { return }
        
        let path = path.isEmpty ? String(node.val) : path + "->\(node.val)"
        if node.left == nil && node.right == nil {
            res.append(path)
            return
        }
        dfs(node.left, path, &res)
        dfs(node.right, path, &res)
    }
     */
    
    // time: O(N), space: O(N)
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var stk = [String](), res = [String]()
        dfs(root, &stk, &res)
        return res
    }
    func dfs(_ node: TreeNode?, _ stk: inout [String], _ res: inout [String]) {
        guard let node = node else { return }
        stk.append(String(node.val))
        if node.left == nil && node.right == nil {
            res.append(stk.joined(separator: "->"))
        }
        dfs(node.left, &stk, &res)
        dfs(node.right, &stk, &res)
        stk.removeLast()
    }
}
