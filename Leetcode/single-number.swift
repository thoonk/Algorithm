// 136. Single Number
// https://leetcode.com/problems/single-number

import Foundation

class Solution1 {
    func singleNumber(_ nums: [Int]) -> Int {
        var counter = [Int: Int]()
        nums.forEach { counter[$0, default: 0] += 1 }
        
        return counter.first { $1 == 1 }?.key ?? .zero
    }
}

class Solution2 {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}
