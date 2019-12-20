//
//  Q273_IntegerEnglishWords.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

class IntegerEnglishWords {

    // time: O(N), space: O(1)
    let underTwenty = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let tens = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    let thousands = ["", "Thousand", "Million", "Billion"]

    func numberToWords(_ num: Int) -> String {
        guard num != 0 else { return "Zero" }
        var num = num
        let neg = num < 0
        if neg { num = -(num + 1) }
        
        var res = ""
        var i = 0
        var carry = neg ? 1 : 0
        while num > 0 || carry > 0 {
            var n = num % 1000 + carry
            carry = n / 1000
            n %= 1000
            
            var word = ""
            if n > 99 {
                word += "\(underTwenty[n / 100]) Hundred "
                n %= 100
            }
            if n > 19 {
                word += "\(tens[n / 10]) "
                n %= 10
            }
            if n > 0 {
                word += "\(underTwenty[n]) "
            }
            res = word + (i > 0 && word.count > 0 ? "\(thousands[i]) " : "") + res
            
            i += 1
            num /= 1000
        }
        res.removeLast()

        return (neg ? "Negative " : "") + res
    }
}
