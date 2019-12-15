//
//  Q680_ValidPalindromeII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class ValidPalindromeII {
    // time: O(N), space: O(N)
    func validPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var start = 0, end = s.count - 1
        while start < end {
            if s[start] != s[end] {
                return isPalindrome(s, start + 1, end) ||
                    isPalindrome(s, start, end - 1)
            }
            start += 1
            end -= 1
        }
        return true
    }
    func isPalindrome(_ s: [Character], _ start: Int, _ end: Int) -> Bool {
        var start = start, end = end
        while start < end {
            if s[start] != s[end] { return false }
            start += 1
            end -= 1
        }
        return true
    }
}
