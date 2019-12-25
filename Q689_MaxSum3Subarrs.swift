//
//  Q689_MaxSum3Subarrs.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class MaxSum3Subarrs {
    /*
       0  1  2  3  4  5  6  7  8
             m  m  m
           /   \______
          l           r

    N [1, 2, 1, 2, 6, 7, 5, 1]
    S [0  1  3  4  6 12 19 24 25]
    L [0  0  0  0  3  4  4  4]
          _  _
             *

    R [4  4  4  4  4  5  6  6]
                      _  _
                      *
    */
    
    // time: O(N), space: O(N)
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var sums = [Int](repeating: 0, count: n+1)
        for i in 0..<n { sums[i+1] = sums[i] + nums[i] }

        var maxSum = sums[k] - sums[0]
        var left = Array(repeating: 0, count: n)
        for i in stride(from: k, to: n, by: 1) { // n-2*k
            let sum = sums[i+1] - sums[i-k+1]
            if sum > maxSum {
                left[i] = i-k+1
                maxSum = sum
            } else {
                left[i] = left[i-1]
            }
        }
        
        maxSum = sums[n] - sums[n-k]
        var right = Array(repeating: n-k, count: n)
        for i in stride(from: n-k-1, through: 0, by: -1) { // k
            let sum = sums[i+k] - sums[i]
            if sum >= maxSum {
                right[i] = i
                maxSum = sum
            } else {
                right[i] = right[i+1]
            }
        }
        
        maxSum = 0
        var res = [0, 0, 0]
        for m in stride(from: k, through: n-2*k, by: 1) {
            let l = left[m-1], r = right[m+k]
            let sum = (sums[l+k] - sums[l]) + (sums[m+k] - sums[m]) + (sums[r+k] - sums[r])
            if sum > maxSum {
                res = [l, m, r]
                maxSum = sum
            }
        }
        return res
    }
}
