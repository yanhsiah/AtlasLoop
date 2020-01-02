//
//  Q114_FlattenBT2LL.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class FlattenBT2LL {
    
    // time: O(N), space: O(H)
    var prevRoot: TreeNode? = nil
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        
        flatten(root.right)
        flatten(root.left)
        root.right = prevRoot
        root.left = nil
        prevRoot = root
    }
}
