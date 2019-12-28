//
//  Q1094_CarPooling.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/27.
//

import Foundation

class Solution {
    // S: # stops, if S >> N, use dict
    // time: O(N), space: O(S)
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        let stops = 1001 // pre scan all trips
        var passengers = Array(repeating: 0, count: stops)
        for t in trips {
            passengers[t[1]] += t[0]
            passengers[t[2]] -= t[0]
        }
        
        var capacity = capacity
        for p in passengers {
            capacity -= p
            if capacity < 0 { return false }
        }
        return true
    }
}
