//
//  Q490_TheMaze.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class TheMaze {
    
    // time & space: O(MN), MN = maze area
    let dy = [-1,0,1,0]
    let dx = [0,1,0,-1]
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        if maze.isEmpty || maze[0].isEmpty { return false }
        let rows = maze.count, cols = maze[0].count
        
        var q = [start]
        var seen = [Int: Set<Int>]()
        while !q.isEmpty {
            var nq = [[Int]]()
            for pos in q {
                let y = pos[0], x = pos[1]
                guard seen[y, default: []].insert(x).inserted else { continue }
                if y == destination[0], x == destination[1] { return true }
                for d in 0..<4 {
                    var ny = y, nx = x
                    while ny >= 0 && ny < rows && nx >= 0 && nx < cols && maze[ny][nx] == 0 {
                        ny += dy[d]
                        nx += dx[d]
                    }
                    ny -= dy[d]
                    nx -= dx[d]
                    if ny != y || nx != x { nq.append([ny, nx]) }
                }
                
            }
            swap(&q, &nq)
        }
        return false
    }
}
