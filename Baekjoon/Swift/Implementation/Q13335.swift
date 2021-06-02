//
//  Q13335.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/02.
//  트럭 / 구현, 시뮬레이션

typealias Truck = (w: Int, t: Int)

var nwl = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = nwl[0]
var w = nwl[1]
var l = nwl[2]

var trucks = readLine()!.split(separator: " ").map { Int(String($0))! }
var time = 0
var q = [Truck]()

while !trucks.isEmpty || !q.isEmpty {
    time += 1
    
    // 트럭이 다리에서 빠져나올 때
    if let t = q.first?.t, time - t == w {
        l += q.removeFirst().w
    }
    
    // 트럭이 다리에 진입할 수 있을 때
    if let truck = trucks.first, truck <= l {
        l -= trucks.removeFirst()
        q.append((truck, time))
    }
}

print(time)
