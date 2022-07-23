//
//  Q14889.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/05.
//  스타트와 링크 / 백트래킹

let n = Int(readLine()!)!
var startLink = [[Int]]()
var check = [Bool](repeating: false, count: n)
var res = Int.max

func dfs(_ cnt: Int, _ current: Int) {
    if cnt == n / 2 {
        var start = [Int]()
        var link = [Int]()
        
        for i in 0 ..< n {
            if check[i] == true {
                start.append(i)
            } else {
                link.append(i)
            }
        }
        
        var startAbil = 0
        var linkAbil = 0
        for i in 0 ..< start.count {
            for j in i+1 ..< start.count {
                startAbil += startLink[start[i]][start[j]] + startLink[start[j]][start[i]]
                linkAbil += startLink[link[i]][link[j]] + startLink[link[j]][link[i]]
            }
        }
        
        res = min(res, abs(startAbil - linkAbil))
        return
    }
    
    for i in current+1 ..< n {
        if check[i] == false {
            check[i] = true
            dfs(cnt+1, i)
            check[i] = false
        }
    }
}

func solution() {
    for _ in 0 ..< n {
        startLink.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    dfs(0,0)
    print(res)
}

solution()
