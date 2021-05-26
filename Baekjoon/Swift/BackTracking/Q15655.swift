//
//  Q15655.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/26.
//  N과 M (6) / 백트래킹

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var nums = readLine()!
    .split(separator: " ")
    .map { Int(String($0))! }
    .sorted()
var arr = [Int]()
var check = [Bool](repeating: false, count: n)

func dfs(_ cnt: Int) {
    if cnt == m {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0 ..< n {
        guard !check[i] else { continue }
        // nums[i] 보다 작은 수 체크
        for j in 0 ... i {
            check[j] = true
        }
        arr.append(nums[i])
        dfs(cnt+1)
        // 다음 수로 넘어가기 전에 체크 해제
        for j in 0 ..< n {
            check[j] = false
        }
        arr.popLast()
    }
}

dfs(0)
