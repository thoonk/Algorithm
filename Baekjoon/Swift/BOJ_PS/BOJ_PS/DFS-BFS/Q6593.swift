//
//  Q6593.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/17.
//  상범 빌딩 / BFS

typealias Coord = (l: Int, r: Int, c: Int)

let d: [Coord] = [(-1,0,0), (1,0,0), (0,-1,0), (0,1,0), (0,0,-1), (0,0,1)]

func bfs(
    _ start: Coord,
    _ exit: Coord,
    _ check: inout [[[Int]]],
    _ building: [[[String]]],
    _ b: Coord
) {
    var q = [Coord]()
    q.append(start)
    check[start.l][start.r][start.c] = 1
    var index = 0
    
    while index < q.count {
        let now = q[index]
        index += 1
        
        for i in 0 ..< 6 {
            let nl = now.l + d[i].l
            let nr = now.r + d[i].r
            let nc = now.c + d[i].c
            
            guard 0 <= nl && nl < b.l &&
                    0 <= nr && nr < b.r &&
                    0 <= nc && nc < b.c
            else { continue }
            
            if check[nl][nr][nc] == 0 {
                if building[nl][nr][nc] == "." || building[nl][nr][nc] == "E" {
                    q.append((nl,nr,nc))
                    check[nl][nr][nc] = check[now.l][now.r][now.c] + 1
                }
            }
        }
    }
}

func solution() {
    while true {
        let lrc = readLine()!.split(separator: " ").map { Int(String($0))! }
        let l = lrc[0]
        let r = lrc[1]
        let c = lrc[2]
        let border: Coord = (l,r,c)
        
        // 반복문 종료조건
        if l == 0 && r == 0 && c == 0 {
            break
        }
        
        var building = [[[String]]](
            repeating: [[String]](
                repeating: [String](),
                count: r
            ),
            count: l
        )
        var check = [[[Int]]](
            repeating: [[Int]](
                repeating: [Int](
                    repeating: 0,
                    count: c
                ),
                count: r
            ),
            count: l
        )
        var start: Coord = (0,0,0)
        var exit: Coord = (0,0,0)
        
        // Input
        for i in 0 ..< l {
            for j in 0 ..< r {
                let input = Array(readLine()!).map { String($0) }
                building[i][j].append(contentsOf: input)
            }
            _ = readLine()!
        }
        
        // 시작과 출구 좌표 저장
        for i in 0 ..< l {
            for j in 0 ..< r {
                for k in 0 ..< c {
                    if building[i][j][k] == "S" {
                        start = (i,j,k)
                    } else if building[i][j][k] == "E" {
                        exit = (i,j,k)
                    }
                }
            }
        }
        
        bfs(start, exit, &check, building, border)
        let res = check[exit.l][exit.r][exit.c]
        if res == 0 {
            print("Trapped!")
        } else {
            print("Escaped in \(res - 1) minute(s).")
        }
    }
}

solution()
