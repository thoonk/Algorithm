// 557. Reverse Words in a String III
// https://leetcode.com/problems/reverse-words-in-a-string-iii/

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").map { String($0.reversed()) }.joined(separator: " ")
    }
}

print(Solution().reverseWords("Let's take LeetCode contest")) // "s'teL ekat edoCteeL tsetnoc"
