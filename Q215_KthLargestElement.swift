//
//  Q215_KthLargestElement.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class KthLargestElement {
    
    // https://www.geeksforgeeks.org/quickselect-algorithm/
    // time: O(N) in average, worst case O(N^2), space: O(1)
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var start = 0, end = nums.count - 1
        while start <= end {
            let m = partition(&nums, start, end)
            if m == k - 1 { return nums[m] }
            if m < k - 1 { start = m + 1 }
            else { end = m - 1 }
        }
        return 0
    }
    func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        nums.swapAt(end, Int.random(in: start...end))
        
        var ptr = start
        for i in start..<end {
            if nums[i] >= nums[end] {
                nums.swapAt(i, ptr)
                ptr += 1
            }
        }
        nums.swapAt(end, ptr)
        return ptr
    }
    
    /**
     while k > 0 && k <= end - start + 1 {
         let ptr = partition(&nums, start, end)
         let left = ptr - start + 1
         if left == k { return nums[ptr] }
         if left < k { start = ptr + 1; k -= left }
         else { end = ptr - 1 }
     }
     */
}
