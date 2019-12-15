//
//  Q125_ValidPalindrome.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/14.
//

import Foundation

class ValidPalindrome {
    // time: O(N), space: O(N)
    func isPalindrome(_ s: String) -> Bool {
        var start = 0, end = s.count - 1
        let s = Array(s.lowercased())
        while start < end {
            while start < end && !s[start].isalnum { start += 1 }
            while start < end && !s[end].isalnum { end -= 1 }
            if s[start] != s[end] {
                return false
            } else {
                start += 1
                end -= 1
            }
        }
        return true
    }
}

extension Character {
    var isalnum: Bool {
        return isLetter || isNumber
    }
}
