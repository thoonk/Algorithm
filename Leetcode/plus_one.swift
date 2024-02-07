// 66. Plus One / https://leetcode.com/problems/plus-one/

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    var addent = 1

    for i in stride(from: digits.count - 1, through: 0, by: -1) {
        result[i] += addent
        addent = result[i] / 10
        result[i] %= 10
    }

    if addent > 0 { result.insert(addent, at: 0) }
    return result
}

print(plusOne([1,2,3])) // [1,2,4]
