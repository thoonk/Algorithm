//
//  Q15656.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/26.
//  N과 M (7) / 백트래킹

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var nums = readLine()!
    .split(separator: " ")
    .map { Int(String($0))! }
    .sorted()
var arr = [String]()
var res = ""

func dfs(_ cnt: Int) {
    if cnt == m {
        // 시간초과 O(n)
        // print(arr.joined(separator:" "))
        res += arr.joined(separator: " ") + "\n"
        return
    }

    for i in 0 ..< n {
        arr.append(String(nums[i]))
        dfs(cnt+1)
        arr.popLast()
    }
}
dfs(0)
print(res)
