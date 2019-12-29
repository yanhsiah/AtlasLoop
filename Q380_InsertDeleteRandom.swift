//
//  Q380_InsertDeleteRandom.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class RandomizedSet {

    // time: O(1), space: O(N)
    var numIndexMap = [Int: Int]()
    var nums = [Int]()
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if let _ = numIndexMap[val] {
            return false
        } else {
            numIndexMap[val] = nums.count
            nums.append(val)
            return true
        }
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let index = numIndexMap[val], let last = nums.last {
            numIndexMap[last] = index
            numIndexMap[val] = nil

            nums.swapAt(index, nums.count - 1)
            nums.removeLast()
            return true
        } else {
            return false
        }
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        // guard let res = nums.randomElement() else { fatalError("Empty Set") }
        // return res
        return nums[Int.random(in: 0..<nums.count)]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
