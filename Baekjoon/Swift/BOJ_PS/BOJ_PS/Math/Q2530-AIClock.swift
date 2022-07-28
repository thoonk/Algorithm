//
//  Q2530-AIClock.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/28.
//  인공지능 시계 / 수학

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var hour = input[0]
var min = input[1]
var sec = input[2]

let cost = Int(readLine()!)!

sec += cost
min += sec / 60
hour += min / 60

print(hour % 24, min % 60, sec % 60)
