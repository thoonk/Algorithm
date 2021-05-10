//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/09.
//  행렬 그리디

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var matrixA = [[Int]]()
var matrixB = [[Int]]()
var res = 0

for _ in 0 ..< n {
    matrixA.append(Array(readLine()!).map { Int(String($0))! })
}
for _ in 0 ..< n {
    matrixB.append(Array(readLine()!).map { Int(String($0))! })
}

func solution() {
    
    guard n >= 3 && m >= 3 else {
        print(isCorrect() == true ? res : -1)
        return
    }
    
    for i in 0 ..< n-2 {
        for j in 0 ..< m-2 {
            if matrixA[i][j] != matrixB[i][j] {
                res += 1
                convertMatrix(i, j)
            }
        }
    }
    print(isCorrect() == true ? res : -1)
}

func convertMatrix(_ r: Int, _ c: Int) {
    for i in r ..< r+3 {
        for j in c ..< c+3 {
            matrixA[i][j] = 1 - matrixA[i][j]
        }
    }
}

func isCorrect() -> Bool {
    for i in 0 ..< n {
        for j in 0 ..< m {
            if matrixA[i][j] != matrixB[i][j] {
                return false
            }
        }
    }
    return true
}

solution()
