//
//  Q340_LongestSubstrKChars.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class LongestSubstrKChars {
    // time: O(N), space: O(N)
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        let s = s.utf8.map { Int($0) }
        var counts = [Int](repeating: 0, count: 256)
        var start = 0, end = 0, kinds = 0
        var res = 0
        while end < s.count {
            if counts[s[end]] == 0 { kinds += 1 }
            counts[s[end]] += 1
            end += 1
            while kinds > k {
                if counts[s[start]] == 1 { kinds -= 1 }
                counts[s[start]] -= 1
                start += 1
            }
            res = max(res, end - start)
        }
        return res
    }
}
