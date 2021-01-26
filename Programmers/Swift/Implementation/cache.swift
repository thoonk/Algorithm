//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/26.
//  캐시 Level2 카카오

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    let cities = cities.map { $0.lowercased() }
    var cache = [String]()
    var cnt = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for i in 0..<cities.count {
        if !cache.contains(cities[i]) {
            if  cache.count < cacheSize {
                cache.append(cities[i])
            } else {
                cache.removeFirst()
                cache.append(cities[i])
            }
            cnt += 5
        } else {
            let cacheIndex = cache.firstIndex(of: cities[i])!
            let temp = cache.remove(at: cacheIndex)
            cache.append(temp)
            cnt += 1
        }
    }
    
    return cnt
}

print(solution(3, ["Jeju","Pangyo","Seoul","NewYork","LA","Jeju","Pangyo","Seoul","NewYork","LA"]))
print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
