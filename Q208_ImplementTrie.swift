//
//  Q208_ImplementTrie.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class Trie {
    
    private class TrieNode {
        var next = [Character: TrieNode]()
        var word = false
    }
    private var root = TrieNode()
    private func find(_ s: String) -> TrieNode? {
        var ptr = root
        for c in s {
            guard let next = ptr.next[c] else { return nil }
            ptr = next
        }
        return ptr
    }

    // time: O(W), space: O(W)
    func insert(_ word: String) {
        var ptr = root
        for c in word {
            if ptr.next[c] == nil { ptr.next[c] = TrieNode() }
            ptr = ptr.next[c]!
        }
        ptr.word = true
    }

    func search(_ word: String) -> Bool {
        guard let node = find(word) else { return false }
        return node.word
    }

    func startsWith(_ prefix: String) -> Bool {
        return find(prefix) != nil
    }
}
