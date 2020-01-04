//
//  Q339_NestedListWeightSum.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/3.
//

import Foundation

class NestedListWeightSum {
    
    // time: O(N), space: O(N)
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var lst = nestedList, res = 0, d = 1
        while !lst.isEmpty {
            var next = [NestedInteger](), sum = 0
            for ni in lst {
                if ni.isInteger() {
                    sum += ni.getInteger()
                } else {
                    next += ni.getList()
                }
            }
            res += d * sum
            d += 1
            swap(&lst, &next)
        }
        return res
    }
}
