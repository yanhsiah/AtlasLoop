//
//  Q1213_Intersection3SortedArrs.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class Intersection3SortedArrs {
    // time: O(N), space: O(1)
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var res = [Int]()
        var i = 0, j = 0, k = 0
        while i < arr1.count && j < arr2.count && k < arr3.count {
            if arr1[i] == arr2[j] && arr2[j] == arr3[k] {
                res.append(arr1[i])
                i += 1; j += 1; k += 1
            } else if arr1[i] < arr2[j] {
                i += 1
            } else if arr2[j] < arr3[k] {
                j += 1
            } else {
                k += 1
            }
        }
        return res
    }
}
