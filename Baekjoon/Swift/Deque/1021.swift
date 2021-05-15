//
//  1021.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/15.
//  회전하는 큐 / 덱

// 디큐하려는 값의 왼쪽과 벌어진 거리와 오른쪽과 벌어진 거리 중 최소 값
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
let indices = readLine()!.split(separator: " ").map { Int(String($0))! }
var q = [Int](1...n)
var res = 0

for index in indices {
    let pos = q.firstIndex(of: index)!
    while true {
        // 뽑으려는 원소의 위치가 큐의 맨 앞에 있다면 뽑고 반복문 나옴
        if index == q[0] {
            q.removeFirst()
            break
        } else {
            // 뽑으려는 원소의 위치가 중간보다 작거나 같으면 왼쪽으로 이동
            if pos <= q.count / 2 {
                q.append(q.removeFirst())
            }
            // 뽑으려는 원소의 위치가 중간보다 작거나 같으면 오른쪽으로 이동
            else {
                q.insert(q.removeLast(), at: 0)
            }
            res += 1
        }
    }
}
print(res)
