//
//  Q1406-LinkedList.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/10/10.
//  에디터 링크드리스트 런타임에러

let MAX_SIZE = 1000005
var data = [String](repeating: "?", count: MAX_SIZE)
var pre = [Int](repeating: -1, count: MAX_SIZE)
var next = [Int](repeating: -1, count: MAX_SIZE)
var unused = 1
let str = readLine()!

func traverse() {
    var cur = next[0]
    while(cur != -1) {
        print(data[cur], terminator: "")
        cur = next[cur]
    }
    print()
}

func insert(pos: Int, val: String) {
    data[unused] = val
    pre[unused] = pos
    next[unused] = next[pos]
    
    if next[pos] != -1 {
        pre[next[pos]] = unused
    }
    
    next[pos] = unused
    unused += 1
}

func remove(at pos: Int) {
    next[pre[pos]] = next[pos]
    
    if next[pos] != -1 {
        pre[next[pos]] = pre[pos]
    }
}

func solution() {
    var cur = 0
    for c in str {
        insert(pos: cur, val: String(c))
        cur += 1
    }
    
    for _ in 0..<Int(readLine()!)! {

        let input = readLine()!.split(separator: " ").map { String($0) }
        
        if input[0] == "P" {
            insert(pos: cur, val: input[1])
            cur = next[cur]
        } else if input[0] == "D" {
            if next[cur] != -1 {
                cur = next[cur]
            }
        } else if input[0] == "B" {
            if cur != 0 {
                remove(at: cur)
                cur = pre[cur]
            }
        } else {
            if pre[cur] != -1 {
                cur = pre[cur]
            }
        }
    }
    traverse()
}

solution()

