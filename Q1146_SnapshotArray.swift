//
//  Q1146_SnapshotArray.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/1.
//

import Foundation

class SnapshotArray {

    // space: O(N)
    var cache = [Int: [(Int, Int)]]()
    var version = 0
    init(_ length: Int) {
        
    }
    
    // time: O(1)
    func set(_ index: Int, _ val: Int) {
        if let vals = cache[index], let (vs, _) = vals.last, vs == version {
            cache[index]![vals.count - 1].1 = val
        } else {
            cache[index, default: []].append((version, val))
        }
    }
    
    // time: O(1)
    func snap() -> Int {
        let res = version
        version += 1
        return res
    }
    
    // Find vs >= version
    // time: O(logN)
    func get(_ index: Int, _ snap_id: Int) -> Int {
        guard let history = cache[index] else { return 0 }

        var start = 0, end = history.count - 1
        while start < end {
            let m = start + (end - start) / 2
            let (vs, _) = history[m]
            if vs < snap_id { start = m + 1 }
            else { end = m }
        }
        let (vs, val) = history[start]
        if vs > snap_id { return start > 0 ? history[start - 1].1 : 0 }
        return val
    }
}
