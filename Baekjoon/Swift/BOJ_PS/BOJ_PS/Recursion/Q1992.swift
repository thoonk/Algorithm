//
//  Q1992.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/10/24.
//  쿼드트리 / 재귀

let n = Int(readLine()!)!
var video = [[Int]]()
var res = ""

for _ in 0..<n {
    let input = Array(readLine()!).map { Int(String($0))! }
    video.append(input)
}

func quadTree(_ dn: Int, _ r: Int, _ c: Int) {
    // 더 이상 나눠지지 않음.
    if n == 1 {
        res.append(String(video[r][c]))
        return
    }
    
    for i in r..<r+dn {
        for j in c..<c+dn {
            // 색이 다르다면 나눠야 함.
            if video[i][j] != video[r][c] {
                res.append("(")
                quadTree(dn/2, r, c) // 1사분면
                quadTree(dn/2, r, c+dn/2) // 2사분면
                quadTree(dn/2, r+dn/2, c) // 3사분면
                quadTree(dn/2, r+dn/2, c+dn/2) //4사분면
                res.append(")")
                return
            }
        }
    }
    
    res.append(String(video[r][c]))
}

quadTree(n, 0, 0)
print(res)
