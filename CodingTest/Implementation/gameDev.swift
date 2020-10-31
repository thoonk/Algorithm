//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/30.
//

import Foundation

// 맵 크기 입력 받기 (4X4)
let place = readLine()!.split(separator: " ").map {Int($0)!}
let n = place[0]
let m = place[1]
// 게임 캐릭터 위치와 방향 입력 받기
let location = readLine()!.split(separator: " ").map {Int($0)!}
var x = location[0]
var y = location[1]
// 0: 북, 1: 동, 2: 남, 3: 서  // 반시계 방향으로 회전
var direct = location[2]

var d = Array(repeating: Array(repeating: 0, count: place[0]), count: place[1])
// 처음 캐릭터가 위치한 칸
d[x][y] = 1

// 방문한 칸의 수
var cnt = 1
// 캐릭터가 회전한 횟수
var turn = 0
// 북 동 남 서
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

// 맵 정보 입력받기
var arrMap = [[Int]]()
for _ in stride(from: 0, to: place[0], by: 1){
    let row = readLine()!.split(separator: " ").map {Int($0)!}
    arrMap.append(row)
}

// 게임 캐릭터 좌회전
func turnLeft(){
    direct -= 1
    if direct == -1{
        direct = 3
    }
}

while true{
    turnLeft()
    var nx = x + dx[direct]
    var ny = y + dx[direct]
    
    // 방문하지 않은 곳이면서 육지인 칸일 경우
    if d[nx][ny] == 0, arrMap[nx][ny] == 0{
        d[nx][ny] = 1
        x = nx
        y = ny
        cnt += 1
        turn = 0
        continue
    }
    // 방문한 곳이거나 바다인 칸일 경우
    else {
        turn += 1
    }
    
    // 모든 방향 갈 칸이 없는 경우
    if turn == 4{
        nx = x - dx[direct]
        ny = y - dy[direct]
        // 뒤가 육지인 경우 한 칸 이동
        if arrMap[nx][ny] == 0{
            x = nx
            y = ny
        }else{
            break
        }
        turn = 0
    }
}
print(cnt)


/* Test Input
 4 4
 1 1 0
 1 1 1 1
 1 0 0 1
 1 1 0 1
 1 1 1 1
 */
