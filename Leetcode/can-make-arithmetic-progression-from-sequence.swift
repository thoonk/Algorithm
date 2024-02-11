// 1502. Can Make Arithmetic Progression From Sequence / https://leetcode.com/problems/can-make-arithmetic-progression-from-sequence/

import Foundation

func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
    let sorted = arr.sorted(by: <)
    var prev = sorted[1] - sorted[0]

    for i in 2..<sorted.count {
        if prev != sorted[i] - sorted[i-1] {
            return false
        }
    }

    return true
}

print(canMakeArithmeticProgression([3,5,1])) // true
