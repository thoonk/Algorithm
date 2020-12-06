//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/05.
//  Q18405 경쟁적 전염 (BFS)

import Foundation

struct Object: Comparable {
    let num: Int
    let x: Int
    let y: Int
    let time: Int
    // 바이러스 번호 순서대로 정렬하기 위함
    static func < (lhs: Object, rhs: Object) -> Bool {
        return lhs.num < rhs.num
    }
}


let nk = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nk[0]
let k = nk[1]

var examiner = Array(repeating: Array(repeating: 0, count: n), count: n)
var virus = [Object]()

for i in stride(from: 0, to: n, by: 1) {
    examiner[i] = readLine()!.split(separator: " ").map {Int(String($0))!}
    
    for j in stride(from: 0, to: n, by: 1) {
        // 바이러스일 경우 virus배열에 삽입
        if examiner[i][j] > 0  {
            virus.append(Object(num: examiner[i][j], x: i, y: j, time: 0))
        }
    }
}

virus.sort()

let sxy = readLine()!.split(separator: " ").map {Int(String($0))!}
let time = sxy[0]
let x = sxy[1] - 1
let y = sxy[2] - 1

var q = [Object]()
// 상, 하, 좌, 우
let d = [(0,-1), (0,1), (-1,0), (1,0)]

for v in virus {
    q.append(v)
}

while !q.isEmpty {
    let v = q.removeFirst()
    
    for i in 0 ..< 4 {
        let nx = v.x + d[i].0
        let ny = v.y + d[i].1
        // 정해진 시험관 경계를 넘어서지 않고 전염시킬 칸이 0이고 정해진 시간을 넘지 않는 경우
        if 0 <= nx, nx < n, 0 <= ny, ny < n, examiner[nx][ny] == 0, v.time < time {
            examiner[nx][ny] = v.num
            q.append(Object(num: v.num, x: nx, y: ny, time: v.time+1))
        }
    }
}
print(examiner[x][y])


