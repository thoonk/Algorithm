//
//  Q2525-ovenClock.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/27.
//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var hour = input[0]
var min = input[1]

let cost = Int(readLine()!)!
let sum = min + cost

if sum >= 60 {
    hour += sum / 60
    min = sum % 60
} else {
    min = sum
}

if hour >= 24 {
    hour -= 24
}

print("\(hour) \(min)")
