//
//  Q3009-fourthPoint.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/31.
//  네번째 점 / 구현

let point1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let point2 = readLine()!.split(separator: " ").map { Int(String($0))! }
let point3 = readLine()!.split(separator: " ").map { Int(String($0))! }

var x4 = 0
var y4 = 0

if point1[0] == point2[0] {
    x4 = point3[0]
} else if point2[0] ==0 point3[0] {
    x4 = point1[0]
} else if point1[0] == point3[0] {
    x4 = point2[0]
}

if point1[1] == point2[1] {
    y4 = point3[1]
} else if point2[1] == point3[1] {
    y4 = point1[1]
} else if point1[1] == point3[1] {
    y4 = point2[1]
}

print(x4, y4)
