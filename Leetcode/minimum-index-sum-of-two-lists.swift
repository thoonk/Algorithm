// 599. Minimum Index Sum of Two Lists
// https://leetcode.com/problems/minimum-index-sum-of-two-lists/

import Foundation

class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var dict = [String: Int]()

        for (i, word1) in list1.enumerated() {
            for (j, word2) in list2.enumerated() {
                if word1 == word2 {
                    dict[word1, default: -1] = i + j
                }
            }
        }

        let mis = dict.values.min()!
        return dict.filter { $0.value == mis }.map { $0.key }
    }
}
