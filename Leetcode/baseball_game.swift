// 682. Baseball Game / https://leetcode.com/problems/baseball-game/

import Foundation

func calPoints(_ operations: [String]) -> Int {
    var nums = [Int]()

    for oper in operations {
        switch oper {
            case "C":
                nums = nums.dropLast()
            case "D":
                nums.append((nums.last ?? 0) * 2)
            case "+":
                nums.append(nums.suffix(2).reduce(0, +))
            default:
                nums.append(Int(oper)!)
        }
    }

    return nums.reduce(0, +)
}

print(calPoints(["5","2","C","D","+"])) // 30
