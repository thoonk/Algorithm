// 541. Reverse String II
// https://leetcode.com/problems/reverse-string-ii/

import Foundation

class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var s = Array(s)
        for i in stride(from: 0, to: s.count, by: 2 * k) {
            let start = i
            let end = min(i+k-1, s.count-1)
            reverse(&s, start, end)
        }
        
        return String(s)
    }

    func reverse(_ s: inout [Character], _ start: Int, _ end: Int) {
        var start = start, end = end

        while start < end {
            s.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

print(Solution().reverseStr("abcdefg", 2)) // bacdfeg
