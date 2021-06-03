//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/23.
//  1697 숨바꼭질 BFS

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
let size = 100001
var check = [Int](repeating: 0, count: size)

func bfs() {
    var q = [Int]()
    q.append(n)
    check[n] = 1
    
    var index = 0
    while index < q.count {
        let x = q[index]
        index += 1
        
        // k 찾았을 때
        if x == k {
            print(check[x] - 1)
            return
        }
        // x - 1일 때
        if 0 <= x-1 && check[x-1] == 0 {
            q.append(x-1)
            check[x-1] = check[x] + 1
        }
        // x + 1일 때
        if x+1 < size && check[x+1] == 0 {
            q.append(x+1)
            check[x+1] = check[x] + 1
        }
        // x * 2일 때
        if x*2 < size && check[x*2] == 0 {
            q.append(x*2)
            check[x*2] = check[x] + 1
        }
    }
}
bfs()

