//
//  Q568_MaxVacationDays.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/2.
//

import Foundation

// 139, 140

class MaxVacationDays {

    // time: O(N^K) --> O(k*N^2)
    // space: O(K)  --> O(K*N)
    var cache = [[Int]]()

    func maxVacationDays(_ flights: [[Int]], _ days: [[Int]]) -> Int {
        if days.isEmpty || days[0].isEmpty { return 0 }
        cache = Array(repeating: Array(repeating: -1, count: days[0].count), count: days.count)

        let res = dfs(flights, days, 0, 0)
        print(cache)
        return res
    }
    
    func dfs(_ flights: [[Int]], _ days: [[Int]], _ curr: Int, _ week: Int) -> Int {
        if week == days[0].count { return 0 }
        if cache[curr][week] != -1 { return cache[curr][week] }

        var res = 0
        for dest in 0..<flights.count {
            if curr == dest || flights[curr][dest] == 1 {
                res = max(res, days[dest][week] + dfs(flights, days, dest, week + 1))
            }
        }
        cache[curr][week] = res
        return res
    }
    
    // time: O(K*N^2), space: O(N)
    func maxVacationDays(_ flights: [[Int]], _ days: [[Int]]) -> Int {
        if days.isEmpty || days[0].isEmpty { return 0 }
        let N = days.count, K = days[0].count
        var dp = Array(repeating: Array(repeating: 0, count: K + 1), count: N)
        for city in 0..<N { dp[city][K] = 0 }

        for week in stride(from: K-1, through: 0, by: -1) {
            for curr in 0..<N {
                for dest in 0..<N where curr == dest || flights[curr][dest] == 1 {
                    dp[curr][week] = max(dp[curr][week], days[dest][week] + dp[dest][week + 1])
                }
            }
        }
        return dp[0][0]
        
        /*
        if days.isEmpty || days[0].isEmpty { return 0 }
        let N = days.count, K = days[0].count
        var dp = Array(repeating: 0, count: N)                                      ///

        for week in stride(from: K-1, through: 0, by: -1) {
            var ndp = Array(repeating: 0, count: N)                                 ///
            for curr in 0..<N {
                for dest in 0..<N where curr == dest || flights[curr][dest] == 1 {
                    ndp[curr] = max(ndp[curr], days[dest][week] + dp[dest])         ///
                }
            }
            swap(&dp, &ndp)                                                         ///
        }
        return dp[0]
        */
    }
}
