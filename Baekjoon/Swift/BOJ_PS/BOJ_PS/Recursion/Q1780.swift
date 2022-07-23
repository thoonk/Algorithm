//
//  Q1780.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/08/08.
//  종이의 개수 / 재귀

let n = Int(readLine()!)!
var papers = [[Int]]()
var cnt = [Int](repeating: 0, count: 3)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    papers.append(input)
}

/// 해당 사이즈의 종이에서 모두 같은 값인지 확인
func checkEqual(_ nn: Int, _ r: Int, _ c: Int) -> Bool {
    for i in r..<r + nn {
        for j in c..<c + nn {
            if papers[i][j] != papers[r][c] {
                return false
            }
        }
    }
    return true
}

/// 재귀를 통해 종이의 사이즈를 줄여 나가면서 카운팅
func divide(_ nn: Int, _ r: Int, _ c: Int) {
    let isEqual = checkEqual(nn, r, c)
    if isEqual == true {
        cnt[papers[r][c]+1] += 1
        return
    } else {
        let size = nn / 3
        for i in 0..<3 {
            for j in 0..<3 {
                divide(size, size * i + r, size * j + c)
            }
        }
    }
}

divide(n, 0, 0)
cnt.forEach { print($0) }
