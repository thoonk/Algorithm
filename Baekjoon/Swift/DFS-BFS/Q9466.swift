//
//  Q9466.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/15.
//  텀 프로젝트 / DFS

func dfs(
    _ num: Int,
    _ nums: [Int],
    _ check: inout [Bool],
    _ team: inout [Int],
    _ teams: inout [[Int]]
) {
    check[num] = true
    team.append(num)
    let s = nums[num]
    
    if check[s] == false {
        dfs(s, nums, &check, &team, &teams)
    } else {
        if team.contains(s) {
            teams.append(Array(team[team.firstIndex(of: s)!...]))
        }
        return
    }
}

for _ in 0 ..< Int(readLine()!)! {
    let n = Int(readLine()!)!
    let nums = [0] + readLine()!.split(separator: " ")
        .map { Int(String($0))! }
    var check = [Bool](repeating: false, count: n+1)
    var teams = [[Int]]()

    for i in 0 ..< n+1 {
        if check[i] == false {
            var team = [Int]()
            dfs(i, nums, &check, &team, &teams)
        }
    }
    print(n + 1 - teams.flatMap({ $0 }).count)
}


