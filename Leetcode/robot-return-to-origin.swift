// 657. Robot Return to Origin / https://leetcode.com/problems/robot-return-to-origin/

import Foundation

func judgeCircle(_ moves: String) -> Bool {
    var coord = (0, 0)
    
    for move in moves {
        switch move {
            case "U":
                coord.1 += 1
            case "D":
                coord.1 -= 1
            case "L":
                coord.0 -= 1
            case "R":
                coord.0 += 1
            default:
                break
        }
    }

    return coord == (0, 0)
}

print(judgeCircle("UD")) // true
