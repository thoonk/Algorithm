// 모음사전 / 84512
import Foundation

func solution(_ word:String) -> Int {
    let alpha = ["A", "E", "I", "O", "U"]
    var temp = [String]()
    
    func dfs(_ str: String) {
        temp.append(str)
        
        if str.count == 5 {
            return
        }
        
        (0..<5).forEach {
            dfs(str + alpha[$0])
        }
    }
    
    dfs("")
    return temp.firstIndex(of: word)!
}

solution("EIO") // 1189
