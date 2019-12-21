//
//  Q297_SerializeBT.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var res = ""
        sHelper(root, &res)
        return res
    }
    func sHelper(_ node: TreeNode?, _ s: inout String) {
        guard let node = node else {
            s += "N "
            return
        }
        s += "\(node.val) "
        sHelper(node.left, &s)
        sHelper(node.right, &s)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var tokens = data.split(separator: " ")
        tokens.reverse()
        return dHelper(&tokens)
    }
    func dHelper(_ tokens: inout [Substring]) -> TreeNode? {
        guard !tokens.isEmpty else { return nil }
        guard let val = Int(String(tokens.removeLast())) else { return nil }
        let node = TreeNode(val)        
        node.left = dHelper(&tokens)
        node.right = dHelper(&tokens)
        return node
    }
}
