//
//  Q691_StickersSpellWord.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/3.
//

import Foundation

class Solution {
    
    // T: # letters in target
    // S: # letters in stickers
    // time: O(2^T * ST), size of cache * for-loop in dfs
    // space: O(2^T), pick or not pick each letter from
    //                target to form a key in the cache
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        return dfs(stickers.map { toCharCount($0) }, toCharCount(target))
    }
    
    var cache = [String: Int]()
    func dfs(_ stickers: [[Int]], _ target: [Int]) -> Int {
        var key = "", start = -1
        for i in 0..<26 where target[i] != 0 {
            if start == -1 { start = i }
            key += String(repeating: toLetter(i), count: target[i])
        }
        if start == -1 { return 0 }
        if let res = cache[key] { return res }

        var res = Int.max
        for sticker in stickers {
            if sticker[start] == 0 { continue }

            // use this sticker, count remain
            var remain = target
            for i in start..<26 {
                remain[i] = max(remain[i] - sticker[i], 0)
            }
            
            let times = dfs(stickers, remain)
            if times != -1 { res = min(res, 1 + times) }
        }

        res = res == Int.max ? -1 : res
        cache[key] = res
        return res
    }
    
    let a = Int(Character("a").asciiValue!)
    func toCharCount(_ s: String) -> [Int] {
        var counts = [Int](repeating: 0, count: 26)
        for c in s { counts[Int(c.asciiValue!) - a] += 1 }
        return counts
    }
    func toLetter(_ i: Int) -> Character {
        return Character(Unicode.Scalar(i + a)!)
    }
}
