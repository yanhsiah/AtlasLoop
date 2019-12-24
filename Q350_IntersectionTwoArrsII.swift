//
//  Q350_IntersectionTwoArrsII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class IntersectionTwoArrsII {
    // time: O(N1 + N2), space: O(min(N1, N2))
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count > nums2.count { return intersect(nums2, nums1) }

        var counts = Dictionary(nums1.map { ($0, 1) }, uniquingKeysWith: +)
        var res = [Int]()        
        for num in nums2 {
            if let count = counts[num], count > 0 {
                res.append(num)
                counts[num] = count - 1
            }
        }
        return res
    }
}
