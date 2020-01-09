//
//  1007_MinDominoRotation.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/9.
//

import Foundation

class MinDominoRotation {
    
    // 2 1 3   => toUp = 2
    // 5 2 2   => toDown = 1

    // time: O(N), space: O(1)
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        guard !A.isEmpty && A.count == B.count else { return -1 }
        let r = rotate(A, B)
        return r != -1 || A[0] == B[0] ? r : rotate(B, A)
    }
    
    func rotate(_ up: [Int], _ down: [Int]) -> Int {
        let target = up[0]
        var toUp = 0, toDown = 0
        for i in 0..<up.count {
            if up[i] != target && down[i] != target { return -1 }
            if up[i] != target { toUp += 1 }
            else if down[i] != target { toDown += 1 }
            // else up[i] == down[i] == target
        }
        return min(toUp, toDown)
    }
}
