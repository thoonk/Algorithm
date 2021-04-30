//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/29.
//  N과 M(9) 백트래킹 중복제거 순열

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var check = [Bool](repeating: false, count: nums.count)
var output = [Int]()

nums.sort()
dfs(0)

func dfs(_ cnt: Int) {
    if cnt == m {
        var line = 0
        output.forEach {
            print($0, terminator: " ")
            line += 1
            if line % m == 0 {
                print()
            }
        }
    }
    
    var duplicated = 0
    for i in 0 ..< n {
        if check[i] == false && duplicated != nums[i] {
            check[i] = true
            output.append(nums[i])
            duplicated = nums[i]
            dfs(cnt+1)
            output.removeLast()
            check[i] = false
        }
    }
}
