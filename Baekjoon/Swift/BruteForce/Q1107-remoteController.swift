//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/21.
//  리모컨 완전탐색(브루트포스)

func isBroken(_ brokenBtns: [Int], _ target: Int) -> Bool {
    let nums = Array(String(target)).map { Int(String($0))! }
    for i in nums {
        if brokenBtns.contains(i) {
            return true
        }
    }
    return false
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var brokenBtns: [Int] = m == 0 ? [] : readLine()!.split(separator: " ").map { Int(String($0))! }
var result = abs(n - 100)

for i in 0 ... 1000000 {
    let check = isBroken(brokenBtns, i)
    if check == true {
       continue
    } else {
        // +,- 버튼 횟수 + 0~9 버튼 누른 횟수
        result = min(result, abs(n - i) + String(i).count)
    }
}

print(result)


