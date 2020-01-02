//
//  Q286_WallsGates.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class WallsGates {

    // time & space: O(MN)

    let dy = [-1,0,1,0]
    let dx = [0,1,0,-1]
    func wallsAndGates(_ rooms: inout [[Int]]) {
        if rooms.isEmpty || rooms[0].isEmpty { return }
        let rows = rooms.count, cols = rooms[0].count
        
        var q = [(Int, Int)]()
        for y in 0..<rows {
            for x in 0..<cols {
                if rooms[y][x] == 0 { q.append((y, x)) }
            }
        }
        
        while !q.isEmpty {
            var nq = [(Int, Int)]()
            for (y, x) in q {
                for d in 0..<4 {
                    let ny = y + dy[d], nx = x + dx[d]
                    if ny < 0 || ny >= rows || nx < 0 || nx >= cols || rooms[ny][nx] <= rooms[y][x] { continue }
                    rooms[ny][nx] = rooms[y][x] + 1
                    nq.append((ny, nx))
                }
            }
            swap(&q, &nq)
        }
    }
}
