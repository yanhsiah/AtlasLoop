//
//  Q825_FriendsAges.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class FriendsAges {
    /*
    A can send request when
    2. A >= B
    1. B > 0.5A + 7

    if A == B => B > 0.5B + 7 => B > 14
    if A > B => B > 0.5A + 7 > 0.5B + 7 => B > 14
    so, A >= B > 14, min A = 15

    3. B <= 100 || A >= 100, trival
    */
    
    // time: O(N), space: O(1)
    func numFriendRequests(_ ages: [Int]) -> Int {
        var buckets = [Int](repeating: 0, count: 121)
        for age in ages { buckets[age] += 1 }
        
        var res = 0
        for a in 15...120 {
            for b in (a >> 1)+8...a { // Int(0.5 * Double(a))
                res += buckets[a] * (buckets[b] - (a == b ? 1 : 0))
            }
        }
        return res
    }
}
