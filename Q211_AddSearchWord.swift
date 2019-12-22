//
//  Q211_AddSearchWord.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/21.
//

import Foundation

class WordDictionary {

    class TrieNode {
        var next = [Character: TrieNode]()
        var word = false
    }
    class Trie {
        var root = TrieNode()
        func add(_ word: String) {
            var ptr = root
            for c in word {
                if ptr.next[c] == nil { ptr.next[c] = TrieNode() }
                ptr = ptr.next[c]!
            }
            ptr.word = true
        }
        func search(_ word: String) -> Bool {
            return dfs(Array(word), 0, root)
        }
        private func dfs(_ s: [Character], _ i: Int, _ node: TrieNode) -> Bool {
            if i == s.count { return node.word }
            let c = s[i]
            if c == "." {
                for (_, next) in node.next {
                    if dfs(s, i + 1, next) { return true }
                }
                return false
            } else {
                guard let next = node.next[c] else { return false }
                return dfs(s, i + 1, next)
            }
        }
    }

    // time: O(W), space: O(W)
    var trie = Trie()
    
    func addWord(_ word: String) {
        trie.add(word)
    }

    func search(_ word: String) -> Bool {
        return trie.search(word)
    }
}
