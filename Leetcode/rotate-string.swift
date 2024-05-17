// 796. Rotate String
// https://leetcode.com/problems/rotate-string/

import Foundation

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        return s.count == goal.count && (s+s).contains(goal)
    }
}
