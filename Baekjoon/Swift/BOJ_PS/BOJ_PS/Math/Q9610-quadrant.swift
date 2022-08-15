//
//  Q9610-quadrant.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/15.
//  사분면

var q = [Int](repeating: 0, count: 5)

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = xy[0]
    let y = xy[1]
    
    if x == 0 || y == 0 {
        q[4] += 1
    } else if x > 0 && y > 0 {
        q[0] += 1
    } else if x < 0 && y > 0 {
        q[1] += 1
    } else if x < 0 && y < 0 {
        q[2] += 1
    } else if x > 0 && y < 0 {
        q[3] += 1
    }
}

for (i, count) in q.enumerated() {
    if i < q.count - 1 {
        print("Q\(i+1): \(count)")
    } else {
        print("AXIS: \(count)")
    }
}
