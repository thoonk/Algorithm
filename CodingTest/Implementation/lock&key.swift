//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/19.
//  자물쇠와 열쇠 (구현) 2020 카카오 코딩테스트
import Foundation

// 시계방향으로 90도 회전
func rotateMatrix90(_ key: [[Int]]) -> [[Int]]{
    let n = key.count
    let m = key[0].count
    
    var result = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in stride(from: 0, to: n, by: 1){
        for j in stride(from: 0, to: m, by: 1){
            result[j][n-i-1] = key[i][j]
        }
    }
    return result
}

func check(_ newLock: [[Int]]) -> Bool{
    let length = newLock.count
    
    for i in stride(from: length, to: length * 2, by: 1){
        for j in stride(from: length, to: length * 2, by: 1){
            if newLock[i][j] != 1{
                return false
            }
        }
    }
    return true
}

func solution(_ key: [[Int]], _ lock:[[Int]]) -> Bool {
    
    let n = lock.count
    let m = key.count
    
    var lotatedKey = key
    var newLock = Array(repeating: Array(repeating: 0, count: n * 3), count: n * 3)
    
    for i in stride(from: 0, to: n, by: 1){
        for j in stride(from: 0, to: n, by: 1){
            newLock[i + n][j + n] = lock[i][j]
        }
    }
    
    for _ in 0 ..< 4{
        lotatedKey = rotateMatrix90(lotatedKey)
        for j in stride(from: 0, to: n * 2, by: 1){
            for k in stride(from: 0, to: n * 2, by: 1){
                for x in stride(from: 0, to: m, by: 1){
                    for y in stride(from: 0, to: m, by: 1){
                        newLock[j + x][k + y] += key[x][y]
                    }
                }
                if check(newLock) == true{
                    return true
                }
                for a in stride(from: 0, to: m, by: 1){
                    for b in stride(from: 0, to: m, by: 1){
                        newLock[j + a][j + b] -= key[a][b]
                    }
                }
            }
        }
    }
    
    return false
}
