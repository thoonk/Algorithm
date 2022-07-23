//
//  Q15650.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/23.
//  n과 m(2) / 백트래킹
//  1부터 N까지 자연수 중에서 중복 없는 오름차순 수열
 
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var arr = [Int](repeating: 0, count: m)
var check = [Bool](repeating: false, count: n+1)

func dfs(_ cnt: Int) {
    if cnt == m {
        for i in 0 ..< m {
            print(arr[i], terminator: " ")
        }
        print() 
        return
    }
    
    for i in 1 ... n {
        guard !check[i] else { continue }
        
        // i보다 작은 수는 모두 체크
        for j in 0 ..< i+1 {
            check[j] = true
        }
        arr[cnt] = i
        dfs(cnt+1)
        // 다음 수로 넘어가기 전에 체크 초기화
        for j in 1 ..< n+1 {
            check[j] = false
        }
    }
}

dfs(0)
