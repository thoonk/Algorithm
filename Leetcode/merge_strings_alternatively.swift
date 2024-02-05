// 1768. Merge Strings Alternately / https://leetcode.com/problems/merge-strings-alternately/

import Foundation

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    var word1 = Array(word1), word2 = Array(word2)
    var index1 = 0, index2 = 0
    var result = ""

    while index1 < word1.count || index2 < word2.count {
        if index1 < word1.count {
            let char1 = word1[word1.index(word1.startIndex, offsetBy: index1)]
            result += String(char1)
        }

        if index2 < word2.count {
            let char2 = word2[word2.index(word2.startIndex, offsetBy: index2)]
            result += String(char2)
        }

        index1 += 1
        index2 += 1
    }

    return result
}

print(mergeAlternately("ab", "pqrs")) // apbqrs
