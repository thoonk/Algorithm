// 1837. Sum of Digits in Base K
// https://leetcode.com/problems/sum-of-digits-in-base-k/

import Foundation

class Solution {
    func sumBase(_ n: Int, _ k: Int) -> Int {
        return String(n, radix: k).reduce(0) { $0 + Int(String($1))! }
    }
}

print(Solution().sumBase(34, 6)) // 9
