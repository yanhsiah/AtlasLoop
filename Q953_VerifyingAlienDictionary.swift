//
//  Q953_VerifyingAlienDictionary.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/19.
//

import Foundation

class VerifyingAlienDictionary {
    // time: O(W * L), space: O(L)
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character: Int]()
        let order = Array(order)
        for i in 0..<order.count { dict[order[i]] = i }
        
        for i in 1..<words.count {
            let prev = Array(words[i - 1])
            let curr = Array(words[i])
            var found = false
            for j in 0..<min(prev.count, curr.count) {
                if prev[j] != curr[j] {
                    guard let prevOrder = dict[prev[j]] else { return false }
                    guard let currOrder = dict[curr[j]] else { return false }
                    if prevOrder > currOrder { return false }
                    found = true
                    break
                }
            }
            if !found && prev.count > curr.count { return false }
        }
        return true
    }
}
