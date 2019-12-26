//
//  Q863_AllNodesDistanceK.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

extension TreeNode : Hashable {
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// time: O(N), space: O(N)
typealias Parents = [TreeNode: TreeNode]
func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
    var res = [Int]()
    guard let root = root, let target = target else { return res }
    var parents = Parents()
    findParents(root, &parents)
    
    var seen = Set<TreeNode>()
    bfs(&res, &seen, target, K, parents)
    return res
}

func findParents(_ node: TreeNode, _ parents: inout Parents) {
    if let left = node.left {
        parents[left] = node
        findParents(left, &parents)
    }
    if let right = node.right {
        parents[right] = node
        findParents(right, &parents)
    }
}

func bfs(_ res: inout [Int], _ seen: inout Set<TreeNode>, _ node: TreeNode, _ k: Int, _ parents: Parents) {
    guard seen.insert(node).inserted else { return }
    if k == 0 {
        res.append(node.val)
        return
    }

    if let l = node.left { bfs(&res, &seen, l, k-1, parents) }
    if let r = node.right { bfs(&res, &seen, r, k-1, parents) }
    if let p = parents[node] { bfs(&res, &seen, p, k-1, parents) }
}

let zero = TreeNode(0)
let one = TreeNode(1)
let two = TreeNode(2)
let three = TreeNode(3)
let four = TreeNode(4)
let five = TreeNode(5)
let six = TreeNode(6)
let seven = TreeNode(7)
let eight = TreeNode(8)


three.left = five; three.right = one
five.left = six; five.right = two
two.left = seven; two.right = four
one.left = zero
one.right = eight

print(distanceK(three, five, 2))
