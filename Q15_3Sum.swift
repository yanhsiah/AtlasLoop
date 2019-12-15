//
//  Q15_3Sum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class ThreeSome {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        guard nums.count >= 3 else { return res }

        let nums = nums.sorted()
        for i in 0..<nums.count - 2 {
            if i > 0 && nums[i] == nums[i - 1] { continue }

            let remain = 0 - nums[i]
            var start = i + 1, end = nums.count - 1
            while start < end {
                let sum = nums[start] + nums[end]
                if sum < remain {
                    start += 1
                } else if sum > remain {
                    end -= 1
                } else {
                    res.append([nums[i], nums[start], nums[end]])

                    repeat {
                        start += 1
                    } while start < end && nums[start] == nums[start - 1]

                    repeat {
                        end -= 1
                    } while start < end && nums[end] == nums[end + 1]
                }
            }
        }
        return res
    }
}
