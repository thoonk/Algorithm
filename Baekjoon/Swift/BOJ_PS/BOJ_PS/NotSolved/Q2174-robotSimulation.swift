//
//  Q2174-robotSimulation.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/21.
//

import Foundation

typealias Coord = (r: Int, c: Int)

let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = ab[0]
let b = ab[1]

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var land = [[Int]](repeating: [Int](repeating: 0, count: a), count: b)

// 0: x좌표, 1: y좌표, 2: 방향
var robots = [[Int]]()
//  0: 명령을 내리는 로봇, 1: 명령의 종류, 2: 명령의 반복 횟수
var commands = [[String](repeating: "", count: 3)]

var directionDictionary: [String: Int] = [
    "N": 0,
    "W": 1,
    "S": 2,
    "E": 3
]
// N W S E
let d = [(0,1), (-1,0), (0,-1), (1,0)]

for i in 0..<n {
    let robot = readLine()!.split(separator: " ").map { String($0) }
    
    let r = b - Int(robot[0])!
    let c = Int(robot[1])! - 1
    
    robots.append([r, c, directionDictionary[robot[2]]!])
    
    land[r][c] = i + 1
}


func turn(_ d: inout Int, _ command: String) {
    d = command == "L" ? -1 : 1
    if d == 4 { d = 0 }
    else if d < 0 { d = 3}
}

func simulate(robot: [String], command: [String]) {
    let robotPosition: Coord = (r: Int(robot[0])!, c: Int(robot[1])!)
    var direction = directionDictionary[robot[2]]
    
}

for _ in 0..<m {
    let command = readLine()!.split(separator: " ").map { String($0) }
    commands.append(command)
    
    let robotNumber = Int(command[0])!
    let commandKind = command[1]
    let commandCount = Int(command[2])!
    
    let robot = robots[robotNumber - 1]
    let r = robot[0]
    let c = robot[1]
    var direction = directionDictionary[robot[2]]!

    if commandKind == "L" || commandKind == "R" {
        turn(&direction, commandKind)
        robots[robotNumber - 1] = [r, c, direction]
    } else {
        let nr = r + d[direction].0
        let nc = c + d[direction].1
    }
}


