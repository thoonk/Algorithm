// 605. Can Place Flowers
// https://leetcode.com/problems/can-place-flowers/

import Foundation

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var remain = n
        var flowerbed = [0] + flowerbed + [0]

        for i in 1..<flowerbed.count-1 {
            guard remain > 0 else { break }

            if flowerbed[i-1] == 0 &&
                flowerbed[i] == 0 &&
                flowerbed[i+1] == 0 {
                    flowerbed[i] = 1
                    remain -= 1
            }
        }
        
        return remain < 1
    }
}

print(Solution().canPlaceFlowers([1,0,0,0,1], 1)) // true
