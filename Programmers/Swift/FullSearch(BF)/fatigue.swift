// 피로도 87946
import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ count: Int, _ k: Int) {
        if result < count {
            result = count
        }

        for (i, dungeon) in dungeons.enumerated() {
            if visited[i] == false, dungeon[0] <= k {
                visited[i] = true
                dfs(count + 1, k - dungeon[1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, k)
    
    return result
}

print(solution(80, [[80,20],[50,40],[30,10]])) // 3
