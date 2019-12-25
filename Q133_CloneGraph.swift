//
//  Q133_CloneGraph.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/24.
//

import Foundation

class CloneGraph {
    class Node {
        var val: Int
        var neighbors: [Node]
        init(_ val: Int, _ neighbors: [Node]) {
            self.val = val
            self.neighbors = neighbors
        }
    }
    extension Node: Hashable {
        static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs === rhs
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
    }

    // time: O(V+E), space: O(V)
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        let copy = Node(node.val, [])
        var copies = [node: copy]
        var q = [node]
        while !q.isEmpty {
            var nq = [Node]()
            for curr in q {
                for next in curr.neighbors {
                    if copies[next] == nil {
                        copies[next] = Node(next.val, [])
                        nq.append(next)
                    }
                    copies[curr]!.neighbors.append(copies[next]!)
                }
            }
            swap(&q, &nq)
        }
        return copy
    }
}
