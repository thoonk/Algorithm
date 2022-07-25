//
//  Q2174-robotSimulation.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/21.
//

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
    "E": 1,
    "S": 2,
    "W": 3
]

let d = [(-1,0), (0,1), (1,0), (0,-1)]

for i in 0..<n {
    let robot = readLine()!.split(separator: " ").map { String($0) }
    
    let r = b - Int(robot[1])!
    let c = Int(robot[0])! - 1
    
    robots.append([r, c, directionDictionary[robot[2]]!])
    
    land[r][c] = i + 1
}


func turn(_ d: inout Int, _ command: String, _ count: Int) {
    let addNumber = command == "L" ? 3 : 1
    for _ in 0..<count {
        d = (d + addNumber) % 4
        print(d)
    }
}

var isWrongCommand = false

for _ in 0..<m {
    let command = readLine()!.split(separator: " ").map { String($0) }
    commands.append(command)
    
    let robotNumber = Int(command[0])!
    let commandKind = command[1]
    let commandCount = Int(command[2])!
    
    let robot = robots[robotNumber - 1]
    var r = robot[0]
    var c = robot[1]
    var direction = robot[2]

    if commandKind == "L" || commandKind == "R" {
        turn(&direction, commandKind, commandCount)
        robots[robotNumber - 1] = [r, c, direction]
    } else {
        for _ in 0..<commandCount {
            let nr = r + d[direction].0
            let nc = c + d[direction].1
            
            if 0 <= nr && nr < b && 0 <= nc && nc < a {
                if land[nr][nc] > 0 {
                    isWrongCommand = true
                    print("Robot \(land[r][c]) crashes into robot \(land[nr][nc])")
                    break
                } else {
                    land[r][c] = 0
                    land[nr][nc] = robotNumber
                    robots[robotNumber -  1] = [nr, nc, direction]
                    r = nr
                    c = nc
                }
            } else {
                isWrongCommand = true
                print("Robot \(land[r][c]) crashes into the wall")
                break
            }
        }
    }
    
    if isWrongCommand {
        break
    }
}

if !isWrongCommand {
    print("OK")
}

