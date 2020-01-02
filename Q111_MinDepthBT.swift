//
//  Q111_MinDepthBT.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class MinDepthBT {
    
    // time: O(N), space: O(H)
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let dl = minDepth(root.left)
        let dr = minDepth(root.right)

        if let left = root.left, let right = root.right {
            return 1 + min(dl, dr)
        } else {
            return 1 + dl + dr
        }
    }
}
