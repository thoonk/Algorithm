//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/19.
//  자물쇠와 열쇠 (구현) 2020 카카오 코딩테스트

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {

    let n = lock.count
    let m = key.count
    
    var newLock = Array(repeating: Array(repeating: 0, count: n * 3), count: n * 3)
    
    var rotatedKey = key
    for i in stride(from: 0, to: n, by: 1) {
        for j in stride(from: 0, to: n, by: 1) {
            newLock[i + n][j + n] = lock[i][j]
        }
    }
    
    for _ in 0 ..< 4 {
        rotatedKey = rotateKey(with: rotatedKey)
        for i in stride(from: 0, to: n * 2, by: 1) {
            for j in stride(from: 0, to: n * 2, by: 1) {
                for x in stride(from: 0, to: m, by: 1) {
                    for y in stride(from: 0, to: m, by: 1) {
                        newLock[i + x][j + y] += rotatedKey[x][y]
                    }
                }
                
                if check(newLock) == true{
                    return true
                }
                
                for x in stride(from: 0, to: m, by: 1) {
                    for y in stride(from: 0, to: m, by: 1) {
                        newLock[i + x][j + y] -= rotatedKey[x][y]
                    }
                }
            }
        }
    }
    return false
}


print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))

func rotateKey(with key: [[Int]]) -> [[Int]] {

    let n = key.count
    let m = key[0].count
    
    var result = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0 ..< n {
        for j in 0 ..< m {
            result[j][n-i-1] = key[i][j]
        }
    }
    return result
}

func check(_ lock: [[Int]]) -> Bool {
    
    let len = lock.count / 3
    
    for i in stride(from: len, to: len * 2, by: 1) {
        for j in stride(from: len, to: len * 2, by: 1) {
            if lock[i][j] == 0 || lock[i][j] == 2 {
                return false
            }
        }
    }
    return true
}

