//
//  CharString.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/20.
//

import Foundation

// https://swift.org/blog/utf8-string/

let str1 = "ABC"
let asciis = str1.utf8.map { Int($0) }
print(asciis)
// [65, 66, 67]

let c = "A"
print(type(of: c.utf8))
c.utf8.forEach {
    print("\($0) type: \(type(of: $0))")
}
print(c.utf8[c.utf8.startIndex])
// UTF8View
// 65 type: UInt8
// 65
