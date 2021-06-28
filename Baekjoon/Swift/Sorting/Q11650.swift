//
//  Q11650.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/28.
//  좌표 정렬하기 / 정렬

typealias Coord = (x: Int, y: Int)

var coord = [Coord]()
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    coord.append((input[0], input[1]))
}

coord.sort { $0.x == $1.x ? $0.y < $1.y : $0.x < $1.x }
coord.forEach {
    print($0.x, $0.y)
}
