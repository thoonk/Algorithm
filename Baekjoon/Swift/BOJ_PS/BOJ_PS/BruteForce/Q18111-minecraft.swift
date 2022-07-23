//
//  Q18111-minecraft.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/02/12.
//  마인크래프트

/*
 높이를 일정하게 바꾸는 것
 
 1. (i,j)의 가장 위에 있는 블록을 제거하여 인벤토리에 넣음, 2초 소요
 2. 인벤토리에서 블록 하나를 꺼내어 (i,j)의 가장 위에 있는 블록 위에 넣음
 
 최대한 빠르게 높이를 일정하게 바꿔야 함.
 땅 고르기 작업에 걸리는 최소 시간, 그 때의 땅의 높이 출력
 
 0 <= 높이 <= 256
 */

let nmb = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = nmb[0]
let m = nmb[1]
/// 인벤토리에 있는 블록의 개수
var b = nmb[2]

var ground = [[Int]]()
var finalCost = Int.max
var maxHeight = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    ground.append(input)
}

func levelingGround() {
    // h = 목표 높이
    for h in 0...256 {
        var push = 0
        var pop = 0
        
        for i in 0..<n {
            for j in 0..<m {
                // 현재 높이가 목표 높이보다 낮다면
                if ground[i][j] < h {
                    pop += (h - ground[i][j])
                } else {
                    push += (ground[i][j] - h)
                }
            }
        }
        let inventory = push + b
        // 인벤토리의 초기 블록 개수와 인벤토리로 들어가는 블록의 개수를 합친 것이 인벤토리에서 나가는 블록의 갯수보다 작다면 땅을 고르게 할 수 없음.
        guard inventory >= pop else {
            continue
        }
        // 총 소요되는 시간
        let cost = 2 * push + pop
        
        if cost <= finalCost {
            finalCost = cost
            maxHeight = h
        }
    }
    
    print(finalCost, maxHeight)
}

levelingGround()

