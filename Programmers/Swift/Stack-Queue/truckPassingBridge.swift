//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/18.
//  다리를 지나는 트럭 큐

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var bridge = [(Int, Int)]()
    var time = 0
    var currentWeight = weight
    var wait = truck_weights
    
    while !wait.isEmpty || !bridge.isEmpty {
        
        time += 1
        
        if let t = bridge.first?.1, time - t == bridge_length {
            currentWeight += bridge.removeFirst().0
        }
        
        if let truck = wait.first, truck <= currentWeight {
            currentWeight -= wait.removeFirst()
            bridge.append((truck, time))
        }
    }
    return time
}

print(solution(2, 10, [7,4,5,6]))
