//
//  Q71_SimplifyPath.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class SimplifyPath {

    // time: O(N), space: O(N)
    func simplifyPath(_ path: String) -> String {
        let tokens = path.split(separator: "/")
        var stk = [String]()
        for token in tokens {
            let s = String(token)
            if s.isEmpty || s == "." { continue }
            if s == ".." {
                if !stk.isEmpty { stk.removeLast() }
                continue
            }
            stk.append(s)
        }
        return "/" + stk.joined(separator: "/")
    }
}
