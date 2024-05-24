// 434. Number of Segments in a String
// https://leetcode.com/problems/number-of-segments-in-a-string/

import Foundation

class Solution {
    func countSegments(_ s: String) -> Int {
        return s.split(separator: " ").count
    }
}
