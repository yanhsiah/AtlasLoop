//
//  Q278_FirstBadVersion.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class FirstBadVersion {
    //               _      1     2    3      4      5
    let versions = [true, true, true, true, false, false]
    func isBadVersion(_ v: Int) -> Bool { return !versions[v] }
    // firstBadVersion(5) // 4

    // time: O(logN), space: O(1)
    func firstBadVersion(_ n: Int) -> Int {
        var start = 1, end = n
        while start < end {
            let m = start + (end - start) / 2
            if !isBadVersion(m) { start = m + 1 }
            else { end = m }
        }
        return start
    }
}




