//
//  Q824_GoatLatin.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class GoatLatin {
    // time: O(N), space: O(N)
    // String, lowercased() -> String
    let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    func toGoatLatin(_ S: String) -> String {
        var latins = [String]()
        let tokens = S.split(separator: " ")
        for i in 0..<tokens.count {
            var s = Array(tokens[i])
            if !vowels.contains(s[0]) { s.append(s.removeFirst()) }
            latins.append("\(String(s))ma\(String(repeating: "a", count: i+1))")
        }
        return latins.joined(separator: " ")
        
        /*
        return S.split(separator: " ").enumerated().map({ i, token in
            var s = Array(token)
            if !vowels.contains(s[0]) { s.append(s.removeFirst()) }
            return "\(String(s))ma\(String(repeating: "a", count: i+1))"
        }).joined(separator: " ")
        */
    }
}
