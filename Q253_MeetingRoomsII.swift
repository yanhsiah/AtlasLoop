//
//  Q253_MeetingRoomsII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class MeetingRoomsII {

    // time: O(NlogN), space: O(N)
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var res = 0
        var starts = [Int](), ends = [Int]()
        for t in intervals {
            starts.append(t[0])
            ends.append(t[1])
        }
        starts = starts.sorted()
        ends = ends.sorted()
        
        var j = 0
        for i in 0..<intervals.count {
            if starts[i] < ends[j] { res += 1 }
            else { j += 1 }
        }
        return res
    }
}
