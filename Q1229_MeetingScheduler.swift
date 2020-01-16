//
//  Q1229_MeetingScheduler.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/16.
//

import Foundation

class Heap<T> {
    private var items = [T]()
    private let cmp: (T, T) -> Bool
    init(_ cmp: @escaping (T, T) -> Bool) { self.cmp = cmp }
    var count: Int { return items.count }
    var first: T? { return items.first }
    
    func append(_ x: T) {
        items.append(x)
        var i = items.count - 1
        while i != 0 {
            let p = (i - 1) / 2
            if cmp(items[p], items[i]) { break }
            items.swapAt(p, i)
            i = p
        }
    }
    func remove() -> T {
        let res = items[0]
        items.swapAt(0, items.count - 1)
        items.removeLast()
        func heapify(_ i: Int) {
            let l = 2 * i + 1, r = l + 1, n = items.count
            var ptr = i
            if l < n && cmp(items[l], items[ptr]) { ptr = l }
            if r < n && cmp(items[r], items[ptr]) { ptr = r }
            if ptr != i { items.swapAt(ptr, i); heapify(ptr) }
        }
        heapify(0)
        return res
    }
}

class Solution {
    func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
        let pq = Heap<[Int]>({ $0[0] < $1[0] })
        for s in slots1 where s[1] - s[0] >= duration { pq.append(s) }
        for s in slots2 where s[1] - s[0] >= duration { pq.append(s) }

        while pq.count > 1 {
            let end1 = pq.remove()[1]
            let start2 = pq.first![0]
            if end1 >= start2 + duration { return [start2, start2 + duration] }
        }
        return []
    }
}
