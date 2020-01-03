//
//  Q17_PhoneNumber.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/15.
//

import Foundation

class PhoneNumber {
    
    // time: O(4^N), space: O(1)
    let dict: [Character: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }

        var res: [String] = [""]
        for d in digits {
            guard let strs = dict[d] else { break }

            var combs = [String]()
            for s1 in res {
                for s2 in strs {
                    combs.append(s1 + s2)
                }
            }
            swap(&res, &combs)
        }
        return res
    }
}
