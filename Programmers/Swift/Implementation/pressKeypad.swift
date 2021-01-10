//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/10.
//  키패드 누르기 카카오 Level1

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var result = ""
    var leftPos = 10
    var rightPos = 11
    
    for n in numbers {
        if [1,4,7].contains(n) {
            leftPos = n
            result += "L"
        } else if [3,6,9].contains(n) {
            rightPos = n
            result += "R"
        } else {
            
            let leftDist = getDist(leftPos, n)
            let rightDist = getDist(rightPos, n)
            
            if leftDist > rightDist {
                result += "R"
                rightPos = n
            } else if leftDist < rightDist {
                result += "L"
                leftPos = n
            } else {
                result += hand == "left" ? "L" : "R"
                if hand == "left" {
                    leftPos = n
                } else {
                    rightPos = n
                }
            }
        }
    }
    
    return result
}

func getDist(_ hand: Int, _ n: Int) -> Int {
    
    let keypad = [
        1:(0,0), 2:(0,1), 3:(0, 2),
        4:(1,0), 5:(1,1), 6:(1, 2),
        7:(2,0), 8:(2,1), 9:(2, 2),
        10:(3,0), 0:(3,1), 11:(3, 2)
    ]
    
    let handX = (keypad[hand]!.0); let handY = (keypad[hand]!.1)
    let nX = keypad[n]!.0; let nY = keypad[n]!.1
    return abs(handX-nX) + abs(handY-nY)
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
