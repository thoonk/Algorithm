//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/06.
//  Q16234 인구이동 삼성

import Foundation

func solution() {
    
    let nlr = readLine()!.split(separator: " ").map {Int(String($0))!}
    let n = nlr[0]
    let l = nlr[1]
    let r = nlr[2]
    
    var map = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0 ..< n {
        map[i] = readLine()!.split(separator: " ").map {Int(String($0))!}
    }
    
    var result = 0
    
    /// 조건에 맞는 국가들을 연합하여 인구 이동
    func buildUnion(with union: inout [[Int]], _ idx: Int, _ x: Int, _ y: Int) {
        
        // 연합한 국가들
        var unitedCountries = [(Int, Int)]()
        unitedCountries.append((x,y))
        
        // 연합된 국가 체크
        union[x][y] = idx
        // 연합의 인구
        var sum = map[x][y]
        
        let d = [(0,-1),(0,1),(-1,0),(1,0)]
        
        var q = [(Int, Int)]()
        q.append((x,y))
        
        while !q.isEmpty {
            let now = q.removeFirst()
            
            for i in 0 ..< 4 {
                let nx = now.0 + d[i].0
                let ny = now.1 + d[i].1
                
                if 0 <= nx, nx < n, 0 <= ny, ny < n, union[nx][ny] == -1{
                    // 인구 차이
                    let numDiff = abs(map[now.0][now.1] - map[nx][ny])
                    // 조건에 맞는 인구차이일 경우 연합에 추가
                    if l <= numDiff, numDiff <= r {
                        q.append((nx,ny))
                        union[nx][ny] = idx
                        sum += map[nx][ny]
                        unitedCountries.append((nx,ny))
                    }
                }
            }
        }
        // 인구 이동
        for (x, y) in unitedCountries {
            map[x][y] = sum / unitedCountries.count
        }
    }
    
    while true {
        var idx = 0
        var union = Array(repeating: Array(repeating: -1, count: n), count: n)
        
        for i in 0 ..< n {
            for j in 0 ..< n {
                // 연합 체크
                if union[i][j] == -1 {
                    buildUnion(with: &union, idx, i, j)
                    idx += 1
                }
            }
        }
        if idx == n * n {
            break
        }
        // 인구 이동 발생 횟수
        result += 1
    }
    print(result)
}

solution()
