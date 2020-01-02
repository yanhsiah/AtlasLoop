//
//  Q549_BTLongestConsecutiveSeqII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/2.
//

import Foundation

class BTLongestConsecutiveSeqII {
    
    // time & space: O(N)
    
    var maxLen = 0
    func longestConsecutive(_ root: TreeNode?) -> Int {
        dfs(root)
        return maxLen
    }
    
    func dfs(_ node: TreeNode?) -> (Int, Int) {
        guard let node = node else { return (0, 0) }
        
        var inc = 1, dec = 1
        if let left = node.left {
            let (incL, decL) = dfs(left)
            if node.val + 1 == left.val {
                inc = incL + 1
            } else if node.val - 1 == left.val {
                dec = decL + 1
            }
        }
        if let right = node.right {
            let (incR, decR) = dfs(right)
            if node.val + 1 == right.val {
                inc = max(inc, incR + 1)
            } else if node.val - 1 == right.val {
                dec = max(dec, decR + 1)
            }
        }
        maxLen = max(maxLen, dec + inc - 1)
        return (inc, dec)
    }
}
