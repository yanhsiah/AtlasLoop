//
//  Q489_RobotRoomCleaner.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

protocol Robot {
    func move() -> Bool
    func turnLeft()
    func turnRight()
    func clean()
}

class RobotRoomCleaner {
    
    // time: O(N), space: O(N)
    // up: 0, right: 1, down: 2, left: 3
    let dy = [-1,0,1,0]
    let dx = [0,1,0,-1]
    func cleanRoom(_ robot: Robot) {
        var seen = [Int: Set<Int>]()
        dfs(robot, &seen, 0, 0, 0)
    }
    
    func dfs(_ robot: Robot, _ seen: inout [Int: Set<Int>], _ y: Int, _ x: Int, _ dir: Int) {
        if !seen[y, default: Set<Int>()].insert(x).inserted { return }
        robot.clean()
        for d in 0..<4 {
            let nd = (dir + d) % 4
            let ny = y + dy[nd], nx = x + dx[nd]
            if robot.move() {
                dfs(robot, &seen, ny, nx, nd)
                robot.turnLeft()
                robot.turnLeft()
                robot.move()
                robot.turnLeft()
            } else {
                robot.turnRight()
            }
        }
    }
}
