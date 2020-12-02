//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/12/01.
//  14502 연구소 (완전탐색, DFS)

import Foundation

func solution() {
    
    
    let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
    let n = nm[0]
    let m = nm[1]
    
    var map = [[Int]]()
    var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
    var result = 0
    
    for _ in 0 ..< n {
        map.append(readLine()!.split(separator: " ").map {Int(String($0))!})
    }
    
    
    func buildWall(_ cnt: Int) {
        var cnt = cnt
        // 벽 3개를 다 세웠을 경우
        if cnt == 3 {
            for i in 0 ..< n {
                for j in 0 ..< m {
                    temp[i][j] = map[i][j]
                }
            }
            
            for i in 0 ..< n {
                for j in 0 ..< m {
                    if temp[i][j] == 2 {
                        spreadVirus(x: i, y: j)
                    }
                }
            }
            var safeCnt = 0
            for i in 0 ..< n {
                for j in 0 ..< m {
                    if temp[i][j] == 0 {
                        safeCnt += 1
                    }
                }
            }
            
            result = max(result, safeCnt)
            return
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                if map[i][j] == 0 {
                    map[i][j] = 1
                    cnt += 1
                    buildWall(cnt)
                    map[i][j] = 0
                    cnt -= 1
                }
            }
        }
    }
    // 벽을 다 세운 후 바이러스 퍼트리기
    func spreadVirus(x: Int, y: Int) {
        // 동, 서, 남, 북
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // map의 범위를 벗어나지 않도록
            if nx >= 0, nx < n, ny >= 0, ny < m {
                if temp[nx][ny] == 0{
                    temp[nx][ny] = 2
                    spreadVirus(x: nx, y: ny)
                }
            }
        }
    }
    
    buildWall(0)
    print(result)
}

solution()


