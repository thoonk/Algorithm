// 조이스틱 / 그리디

import Foundation

func solution(_ name:String) -> Int {
    var alphabet_move = 0
    var cursor_move = name.count - 1
    var name = Array(name)
    
    for (i, char) in name.enumerated() {
        alphabet_move += min(Int(char.asciiValue!) - 65, 90 - Int(char.asciiValue!) + 1)
        
        var next = i + 1
        while next < name.count, name[next] == "A" {
            next += 1
        }
        
        cursor_move = min(cursor_move, 2 * i + name.count - next, i + 2 * (name.count - next))
    }
    
    return alphabet_move + cursor_move
}
