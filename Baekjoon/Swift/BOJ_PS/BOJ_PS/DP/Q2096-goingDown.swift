//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/26.
//  내려가기 DP, 슬라이딩 윈도우

let n = Int(readLine()!)!
var maxDp = [Int](repeating: 0, count: n)
var minDp = [Int](repeating: 0, count: n)
var tempMax = [Int](repeating: 0, count: n)
var tempMin = [Int](repeating: 0, count: n)

func solution() -> (Int, Int) {
    
    for _ in 0 ..< n {
        tempMax = readLine()!.split(separator: " ").map { Int(String($0))! }
        tempMin = tempMax
        
        guard n > 1 else { return (tempMax.max()!, tempMin.min()!) }
        
        for j in 0 ..< 3 {
            tempMax[j] += max(maxDp[1], j == 1 ? max(maxDp[0], maxDp[2]) : maxDp[j])
            tempMin[j] += min(minDp[1], j == 1 ? min(minDp[0], minDp[2]) : minDp[j])
        }
        // 이전 Row를 인덱스별 최댓값을 더한 새로운 Row로 갱신
        maxDp = tempMax
        minDp = tempMin
    }
    
    return (maxDp.max()!, minDp.min()!)
}

let result = solution()
print(result.0, result.1)
