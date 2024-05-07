// 830. Positions of Large Groups
// https://leetcode.com/problems/positions-of-large-groups/

import Foundation

class Solution {
    func largeGroupPositions(_ s: String) -> [[Int]] {
        var result = [[Int]]()
        let s = Array(s)
        var prev = s[0]
        var start = 0
        
        for i in 1..<s.count {
            if s[i] != prev {
                result.append([start, i - 1])
                prev = s[i]
                start = i
            }
        }
        
        result.append([start, s.count - 1])
        return result.filter { ($0[1] - $0[0]) > 1 }
    }
}
