//
//  Q973_KClosestPointsOrigin.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class KClosestPointsOrigin {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var points = points
        var start = 0, end = points.count - 1
        while true {
            let ptr = partition(&points, start, end)
            if ptr == K - 1 { break }
            if ptr < K - 1 { start = ptr + 1 }
            else { end = ptr - 1 }
        }
        return Array(points[0..<K])
    }
    
    func partition(_ points: inout [[Int]], _ start: Int, _ end: Int) -> Int {
        points.swapAt(end, Int.random(in: start...end))
        
        func dist(_ p: [Int]) -> Int { return p[0] * p[0] + p[1] * p[1] }
        var pivot = dist(points[end])
        var ptr = start
        for i in start..<end {
            if dist(points[i]) <= pivot {
                points.swapAt(i, ptr)
                ptr += 1
            }
        }
        points.swapAt(ptr, end)
        return ptr
    }
}
