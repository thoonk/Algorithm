// 125. Valid Palindrome
// https://leetcode.com/problems/valid-palindrome/

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return s == String(s.reversed())
    }
}
