// 191. Number of 1 Bits
// https://leetcode.com/problems/number-of-1-bits

import Foundation

class Solution1 {
    func hammingWeight(_ n: Int) -> Int {
        return String(n, radix: 2).filter { $0 == "1" }.count
    }
}

class Solution2 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, result = 0
        while n != 0 {
            result += n & 1
            n >>= 1
        }

        return result
    }
}
