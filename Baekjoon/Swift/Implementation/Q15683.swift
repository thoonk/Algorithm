//
//  Q15683.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/27.
//  감시 / 구현, DFS

typealias Coord = (r: Int, c: Int)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var office = [[Int]](repeating: [Int](), count: n)
// office의 copy
var copied = [[Int]]()
// 오, 위, 왼, 아
let d: [Coord] = [(0, 1),(-1,0),(0,-1),(1,0)]
var res = Int.max
// cctv의 위치
var cctv = [Coord]()
// cctv가 감시하는 방향
var cctvDir = [Int]()
// cctv가 감시할 수 있는 방향 체크
var check = [[[Bool]]](
    repeating: [[Bool]](
        repeating: [Bool](
            repeatElement(false, count: 4)),
            count: m
    ),
    count: n
)

func dfs(_ cnt: Int) {
    if cnt == cctv.count {
        for i in 0 ..< cctvDir.count {
            rotateDirect(i, cctv[i].r, cctv[i].c)
        }
        // 사각지대 개수 구하기
        let temp = copied
            .flatMap({ $0 })
            .filter({ $0 == 0 })
            .count
        res = min(res, temp)
        // 다음 경우의 수를 위해 초기 값으로 초기화
        copied = office
        return
    }
    
    for i in 0 ..< 4 {
        cctvDir.append(i)
        dfs(cnt+1)
        cctvDir.popLast()
    }
}

// index: cctv가 감시하고 있는 방향
func rotateDirect(_ index: Int, _ r: Int, _ c: Int) {
    for i in 0 ..< 4 {
        // CCTV가 감시할 수 있는 방향일 때
        if check[r][c][i] == true {
            var nr = r + d[(cctvDir[index]+i)%4].r
            var nc = c + d[(cctvDir[index]+i)%4].c
            
            while true {
                // 범위 체크
                guard 0 <= nr && nr < n && 0 <= nc && nc < m else { break }
                // 벽일 때
                guard copied[nr][nc] != 6 else { break }
                // 감시되는 구역 체크
                if copied[nr][nc] == 0 {
                    copied[nr][nc] = -1
                }
                // 계속해서 같은 방향의 다음 구역
                nr += d[(cctvDir[index]+i)%4].r
                nc += d[(cctvDir[index]+i)%4].c
            }
        }
    }
}

func solution() {
    for i in 0 ..< n {
        office[i]
            .append(contentsOf: readLine()!.split(separator: " ")
                        .map { Int(String($0))! })
    }
    copied = office
    
    for r in 0 ..< n {
        for c in 0 ..< m {
            // cctv일 때
            if 1 <= office[r][c] && office[r][c] <= 5 {
                cctv.append((r,c))
            }
            
            switch office[r][c] {
            case 1:
                check[r][c][0] = true
            case 2:
                check[r][c][0] = true
                check[r][c][2] = true
            case 3:
                check[r][c][0] = true
                check[r][c][1] = true
            case 4:
                check[r][c][0] = true
                check[r][c][1] = true
                check[r][c][2] = true
            case 5:
                check[r][c][0] = true
                check[r][c][1] = true
                check[r][c][2] = true
                check[r][c][3] = true
            default:
                break
            }
        }
    }
    dfs(0)
    print(res)
}
solution()

