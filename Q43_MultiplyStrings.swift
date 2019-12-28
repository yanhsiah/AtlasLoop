//
//  Q43_MultiplyStrings.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class MultiplyStrings {

    // time & space: O(L1+L2)
    func multiply(_ num1: String, _ num2: String) -> String {
        let zero = Int(Character("0").asciiValue!)
        let nums1 = num1.utf8.map { Int($0) - zero }
        let nums2 = num2.utf8.map { Int($0) - zero }
        var res = Array(repeating: 0, count: nums1.count + nums2.count)
        for i in stride(from: nums1.count-1, through: 0, by: -1) {
            var carry = 0
            for j in stride(from: nums2.count-1, through: 0, by: -1) {
                carry += res[i+j+1] + nums1[i] * nums2[j]
                res[i+j+1] = carry % 10
                carry /= 10
            }
            res[i] += carry
        }
        
        for i in 0..<res.count where res[i] != 0 {
            return res[i..<res.count].map { String($0) }.joined(separator: "")
        }
        return "0"
    }
}
