//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/29.
//  베스트앨범 Level3

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genreData = [String:(total: Int, data: [(index: Int, play: Int)])]()
    var result = [Int]()
    
    for (i, v) in genres.enumerated() {
        if !genreData.keys.contains(v) {
            genreData[v] = (plays[i], [(i, plays[i])])
        } else {
            let total = genreData[v]!.total + plays[i]
            var data = genreData[v]!.data
            data.append((i, plays[i]))
            genreData[v] = (total, data)
        }
    }
    
    let sortedGenreData = genreData.sorted { $0.value.total > $1.value.total }
    
    sortedGenreData.forEach {
        let sortedData = $0.value.data.sorted { $0.play == $1.play ? $0.index < $1.index : $0.play > $1.play }
        let cnt = sortedData.count > 1 ? 2 : 1
        
        for i in 0..<cnt {
            result.append(sortedData[i].index)
        }
    }
    return result
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
