//
//  Q349_IntersectionTwoArrs.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class IntersectionTwoArrs {
    // time: O(N1 + N2), space: O(min(N1, N2))
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count > nums2.count { return intersection(nums2, nums1) }

        var res = [Int]()
        var nums1 = Set(nums1)
        for num in nums2 where nums1.contains(num) {
            res.append(nums1.remove(num)!)
        }
        return res
    }
}
