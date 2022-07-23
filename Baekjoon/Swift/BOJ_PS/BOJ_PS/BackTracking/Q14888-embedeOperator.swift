//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/06.
//  연산자 끼워넣기 / 백트래킹

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var oprt = readLine()!.split(separator: " ").map { Int(String($0))! }

var plus = oprt[0]
var minus = oprt[1]
var multi = oprt[2]
var div = oprt[3]

var maxVal = Int.min
var minVal = Int.max

func solution(_ cnt: Int, _ res: Int) {
    if cnt == n {
        maxVal = max(maxVal, res)
        minVal = min(minVal, res)
    }
    
    if plus > 0 {
        plus -= 1
        solution(cnt+1, res + nums[cnt])
        plus += 1
    }
    
    if minus > 0 {
        minus -= 1
        solution(cnt+1, res - nums[cnt])
        minus += 1
    }
    
    if multi > 0 {
        multi -= 1
        solution(cnt+1, res * nums[cnt])
        multi += 1
    }
    
    if div > 0 {
        div -= 1
        solution(cnt+1, res / nums[cnt])
        div += 1
    }
}

solution(1, nums.first!)
print(maxVal, minVal, separator: "\n")
