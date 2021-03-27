//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/27.
//  주사위 굴리기 구현

typealias Coord = (r: Int, c: Int)
// 동,서,북,남 순
let d: [Coord] = [(0,1),(0,-1),(-1,0),(1,0)]
// 위,북,동,서,남,아래 순
var dice = [Int](repeating: 0, count: 6)
var map = [[Int]]()

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
var dicePos: Coord = (input[2], input[3])
let k = input[4]

for _ in 0..<n {
    let element = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(element)
}

let cmds = readLine()!.split(separator: " ").map { Int(String($0))! }

solution()

func solution() {
    for cmd in cmds {
        let direction = cmd-1
        let nr = dicePos.r + d[direction].r
        let nc = dicePos.c + d[direction].c
        
        if 0<=nr && nr<n && 0<=nc && nc<m {
            // 동
            rollDice(to: direction)
            
            if map[nr][nc] == 0 {
                map[nr][nc] = dice[5]
            } else {
                dice[5] = map[nr][nc]
                map[nr][nc] = 0
            }
            
            dicePos = (nr, nc)
            print(dice[0])
        } else {
            continue
        }
    }
}

func rollDice(to direction: Int) {
    let temp = dice
    if direction == 0 {
        dice[0] = temp[3]
        dice[2] = temp[0]
        dice[3] = temp[5]
        dice[5] = temp[2]
    }
    // 서
    else if direction == 1 {
        dice[0] = temp[2]
        dice[2] = temp[5]
        dice[3] = temp[0]
        dice[5] = temp[3]
    }
    // 북
    else if direction == 2 {
        dice[0] = temp[4]
        dice[1] = temp[0]
        dice[4] = temp[5]
        dice[5] = temp[1]
    }
    // 남
    else {
        dice[0] = temp[1]
        dice[1] = temp[5]
        dice[4] = temp[0]
        dice[5] = temp[4]
    }
}
