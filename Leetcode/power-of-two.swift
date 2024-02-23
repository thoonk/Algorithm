// 231. Power of Two
// https://leetcode.com/problems/power-of-two/

import Foundation

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        if n == 1 { return true }
        guard n % 2 == 0 else { return false }
        return isPowerOfTwo(n/2)
    }
}
print(Solution().isPowerOfTwo(16)) // true
