//
//  Q238_ProductArrayExceptSelf.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class ProductArrayExceptSelf {

    // time: O(N), space: O(1)
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // guard nums.count >= 2 else { return nums }
        let n = nums.count
        var res = [Int](repeating: 1, count: n)
        var fromBegin = 1, fromEnd = 1
        for i in 0..<n {
            res[i] *= fromBegin
            fromBegin *= nums[i]
            res[n - 1 - i] *= fromEnd
            fromEnd *= nums[n - 1 - i]
        }
        return res
    }
}
