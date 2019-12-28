//
//  Q42_TrappingRainWater.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class TrappingRainWater {
    
    // time: O(N), space: O(1)
    func trap(_ height: [Int]) -> Int {
        var h = height
        var start = 0, end = h.count - 1
        var res = 0
        while start < end {
            if h[start] < h[end] {
                if start+1 < end {
                    res += max(0, h[start] - h[start+1])
                    h[start+1] = max(h[start+1], h[start])
                }
                start += 1
            } else {
                if end-1 > start {
                    res += max(0, h[end] - h[end-1])
                    h[end-1] = max(h[end-1], h[end])
                }
                end -= 1
            }
        }
        return res
    }
}
