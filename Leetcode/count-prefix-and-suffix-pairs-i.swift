// 3042. Count Prefix and Suffix Pairs I
// https://leetcode.com/problems/count-prefix-and-suffix-pairs-i/

import Foundation

class Solution {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        var result = 0

        for i in 0..<words.count - 1 {
            for j in (i+1)..<words.count {
                if words[j].hasPrefix(words[i]) &&
                    words[j].hasSuffix(words[i]) {
                        print(words[i], words[j])
                        result += 1
                    }
            }
        }

        return result
    }
}

print(Solution().countPrefixSuffixPairs(["a","aba","ababa","aa"])) // 4
