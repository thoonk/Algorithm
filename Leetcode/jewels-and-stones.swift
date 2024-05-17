// 771. Jewels and Stones
// https://leetcode.com/problems/jewels-and-stones/

import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        return stones.filter { jewels.contains($0) }.count
    }
}
