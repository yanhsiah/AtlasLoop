//
//  Q721_AccountsMerge.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class DSU {
    var parents = [Int](), ranks = [Int]()
    func union(_ a: Int, _ b: Int) {
        let a = find(a), b = find(b)
        if a != b {
            if ranks[a] < ranks[b] {
                parents[a] = b
            } else {
                parents[b] = a
                if ranks[a] == ranks[b] { ranks[a] += 1 }
            }
        }
    }
    func find(_ x: Int) -> Int {
        var x = x
        while parents[x] != x {
            parents[x] = parents[parents[x]]
            x = parents[x]
        }
        return x
    }
    func add(_ i: Int) {
        parents.append(i)
        ranks.append(0)
    }
}

class AccountsMerge {
    
    // E: # of emails
    // time: O(EaE) ~= O(E), a: inverse-ackermann function
    // space: O(E)
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let dsu = DSU()
        var emailInfo = [String: (Int, String)]()
        for i in 0..<accounts.count {
            let a = accounts[i]
            guard a.count > 1 else { continue }
            for j in 1..<a.count {
                if emailInfo[a[j]] == nil {
                    let eid = emailInfo.count
                    emailInfo[a[j]] = (eid, a[0])
                    dsu.add(eid)
                }
                if j > 1 { dsu.union(emailInfo[a[j]]!.0, emailInfo[a[1]]!.0) }
            }
        }

        var unions = [Int: [String]]()
        for (email, (eid, _)) in emailInfo {
            unions[dsu.find(eid), default: []].append(email)
        }
        return unions.map { [emailInfo[$0.value[0]]!.1] + $0.value.sorted() }
    }
}

