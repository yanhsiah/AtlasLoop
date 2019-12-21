//
//  Q428_SerializeNTree.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class Codec {
    func serialize(_ root: Node?) -> String {
        var res = ""
        sHelper(root, &res)
        return res
    }
    func sHelper(_ node: Node?, _ s: inout String) {
        guard let node = node else {
            s += "N "
            return
        }
        s += "\(node.val) \(node.children.count) "
        for child in node.children { sHelper(child, &s) }
    }
    
    func deserialize(_ data: String) -> Node? {
        var tokens = data.split(separator: " ")
        tokens.reverse()
        return dHelper(&tokens)
    }
    func dHelper(_ tokens: inout [Substring]) -> Node? {
        guard !tokens.isEmpty else { return nil }
        guard let val = Int(String(tokens.removeLast())) else { return nil }
        let node = Node(val, [Node?]())
        guard !tokens.isEmpty else { return node }
        guard let n = Int(String(tokens.removeLast())) else { return node }
        for _ in 0..<n { node.children.append(dHelper(&tokens)) }
        return node
    }
}

var root = Node(1, [
    Node(3, [
        Node(5, []),
        Node(6, [])
    ]),
    Node(2, []),
    Node(4, [])
])
let question = Codec()
let data = question.serialize(root)
print(data)
var ptr = question.deserialize(data)

print(ptr!.val)
for child in ptr!.children {
    guard let child = child else { continue }
    print(child.val, terminator: " ")
}
print("")
for child in ptr!.children[0]!.children {
    guard let child = child else { continue }
    print(child.val, terminator: " ")
}
