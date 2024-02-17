// 860. Lemonade Change
// https://leetcode.com/problems/lemonade-change/

import Foundation

func lemonadeChange(_ bills: [Int]) -> Bool {
    var change5 = 0
    var change10 = 0

    for bill in bills {
        switch bill {
            case 5:
                change5 += 1
            case 10:
                change10 += 1
                guard change5 > 0 else { return false }
                change5 -= 1
            case 20:
                guard change5 > 0 && change10 > 0 || change5 >= 3 else { return false }
                if change10 >= 1 {
                    change10 -= 1
                    change5 -= 1
                } else {
                    change5 -= 3
                }
            default: break
        }
    }

    return true
}
print(lemonadeChange([5,5,5,10,20])) // true
