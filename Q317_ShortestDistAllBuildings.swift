//
//  Q317_ShortestDistAllBuildings.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/2.
//

import Foundation

class ShortestDistAllBuildings {
    
    // Using BFS simutaneously for k buildings is not correct:
    // if 1 and 2 intersect earlier then meet 3 later, the first
    // intersection of 1,2,3 is not the min distant point to 1,2,3.
    // Use distMap and minDist array.

    // time: O(kMN), k buildings, M*N board
    // space: O(MN)
    func shortestDistance(_ grid: [[Int]]) -> Int {
        var grid = grid
        if grid.isEmpty || grid[0].isEmpty { return -1 }
        let rows = grid.count, cols = grid[0].count
        
        var distMap = [Int: [Int: (Int, Int)]]() // y: x: (reach, dist)
        var minDist = [0] // minDist[reach] = min dist
        
        var buildings = 0, reachable = 0
        for y in 0..<rows {
            for x in 0..<cols {
                if grid[y][x] == 1 {
                    buildings += 1
                    bfs(&grid, rows, cols, y, x, reachable, &distMap, &minDist)
                    reachable -= 1
                }
            }
        }
        return minDist.count > buildings ? minDist[buildings] : -1
    }
    
    let dy = [-1,0,1,0], dx = [0,1,0,-1]
    func bfs(_ grid: inout [[Int]], _ rows: Int, _ cols: Int, _ y: Int, _ x: Int, _ reachable: Int, _ distMap: inout [Int: [Int: (Int, Int)]], _ minDist: inout [Int]) {
        var q = [(y, x)]
        var dist = 1
        while !q.isEmpty {
            var nq = [(Int, Int)]()
            for (y, x) in q {
                for d in 0..<4 {
                    let ny = y + dy[d], nx = x + dx[d]
                    if ny < 0 || ny >= rows || nx < 0 || nx >= cols || grid[ny][nx] != reachable {
                        continue
                    }
                    grid[ny][nx] -= 1
                    nq.append((ny, nx))
                    
                    var (tr, td) = distMap[ny, default: [:]][nx, default: (0, 0)]
                    tr += 1
                    td += dist
                    distMap[ny, default: [:]][nx] = (tr, td)

                    if minDist.count == tr { minDist.append(td) }
                    else { minDist[tr] = min(minDist[tr], td) }
                }
            }
            swap(&q, &nq)
            dist += 1
        }
    }
}
