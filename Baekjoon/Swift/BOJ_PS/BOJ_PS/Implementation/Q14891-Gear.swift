//
//  Q14891-Gear.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/07.
//  톱니바퀴 구현

var gears = [[Int]](repeating: [Int](), count: 4)

for i in 0..<4 {
    let input = Array(readLine()!).map { Int(String($0))! }
    gears[i] = input
}

func rotate(direction: Int, gear: [Int]) -> [Int] {
    var newGear = [Int](repeating: 0, count: 8)
    // 시계 방향
    if direction == 1 {
        newGear[0] = gear[7]
        for i in 0..<7 {
            newGear[i+1] = gear[i]
        }
    }
    // 반시계 방향
    else {
        newGear[7] = gear[0]
        for i in 1..<8 {
            newGear[i-1] = gear[i]
        }
    }
    
    return newGear
}

func checkRotatable(targetGear: Int, direction: Int) -> [(Int, Int)] {
    var rotatableGears = [(Int, Int)]()
    rotatableGears.append((targetGear - 1,  direction))
    
    var q = [(Int, Int)]()
    q.append((targetGear - 1,  direction))
    
    var visited = [Bool](repeating: false, count: 4)
    visited[targetGear - 1] = true
    
    var index = 0
    while index < q.count {
        let now = q[index]
        let target = now.0
        let dir = now.1
        index += 1
        
        // 기준 톱니 왼쪽 바퀴 체크
        var nx = target - 1
        if 0 <= nx && nx < 4
            && gears[nx][2] != gears[target][6]
            && visited[nx] == false {
            q.append((nx, -dir))
            rotatableGears.append((nx, -dir))
            visited[nx] = true
        }
 
        // 기준 톱니 오른쪽 바퀴 체크
        nx = now.0 + 1
        if 0 <= nx && nx < 4
            && gears[nx][6] != gears[target][2]
            && visited[nx] == false {
            q.append((nx, -dir))
            rotatableGears.append((nx, -dir))
            visited[nx] = true
        }
    }
    
    return rotatableGears
}

let k = Int(readLine()!)!
var scores = [1, 2, 4, 8]

for _ in 0..<k {
    let methods = readLine()!.split(separator: " ").map { Int(String($0))! }
    let rotatableGears = checkRotatable(targetGear: methods[0], direction: methods[1])
    
    rotatableGears.forEach {
        gears[$0] = rotate(direction: $1, gear: gears[$0])
    }
}

var result = 0
for i in 0..<4 {
    result += gears[i][0] == 1 ? scores[i] : 0
}

print(result)
