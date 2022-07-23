//
//  Q10815-numberCard.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/10.
//  숫자 카드 이분 탐색

var n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map {
    Int(String($0))! }.sorted()

var m = Int(readLine()!)!
var integers = readLine()!.split(separator: " ").map {
    Int(String($0))! }

var result = [Int]()

func binarySearch(cards: [Int], num: Int) -> Int {
    if num < cards[0] {
        return 0
    } else if num > cards[cards.count - 1] {
        return 0
    } else {
        var start = 0
        var end = cards.count - 1
        var mid = (start + end) / 2
        
        while start <= end {
            mid = (start + end) / 2
            
            if cards[mid] == num {
                return 1
            } else if cards[mid] < num {
                start = mid + 1
            } else if cards[mid] > num {
                end = mid - 1
            }
        }
    }

    return 0
}

for integer in integers {
    result.append(binarySearch(cards: cards, num: integer))
}

print(result.map { String($0) }
    .joined(separator: " "))
