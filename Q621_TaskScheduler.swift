//
//  Q621_TaskScheduler.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class Solution {
    
    // A count hash map:
    // let counts = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
    
    // Sort dictionary by key / value
    // let keys = counts.keys.sorted { counts[$0]! > counts[$1]!  }
    
    // For loop from start to end, increment by k
    // for i in stride(from: start, to: end, by: k) { }
    
    /*
    https://leetcode.com/problems/task-scheduler/solution/
    tasks = [A,A,A,B,B,B], k = 2
    Find the largest task (A) with idles
    A _ _      _ _ _
    A _ _  =>  _ _ _
    A _ _
    Fill in the rest tasks (B)
    A B _
    A B _  => res = 8
    A B
    */
    
    // time: O(N), space: O(1)
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        // Use array for faster run time
        /*
        let base = Int(Character("A").asciiValue!)
        var counts: [Int] = Array(repeating: 0, count: 26)
        var maxCount = 0
        for i in 0..<tasks.count {
            let index = Int(tasks[i].asciiValue!) - base
            counts[index] += 1
            maxCount = max(maxCount, counts[index])
        }
        let maxRepeat = maxCount - 1
        var idles = maxRepeat * (n + 1)
        for i in 0..<counts.count {
            idles -= min(maxRepeat, counts[i])
        }
        return tasks.count + max(0, idles)
        q*/
        
        // Use dictionary for handling all ascii chars
        let counts = Dictionary(tasks.map { ($0, 1) }, uniquingKeysWith: +)
        let maxRepeat = counts.values.max()! - 1
        var idles = maxRepeat * (n + 1)
        for (_, count) in counts {
            idles -= min(maxRepeat, count)
        }
        return tasks.count + max(0, idles)
    }
}
