//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/05.
//  가르침 / 비트마스크 시간초과

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var result = 0
var words = [Int](repeating: 0, count: n)

for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    for w in input {
        words[i] |= (1 << (ord(Character(w)) - ord("a")))
    }
}

print(solution())

func solution() -> Int {
    guard k >= 5 else { return 0 }
    
    let alpha = ["b", "d", "e", "f", "g", "h", "j", "k", "l", "m", "o", "p", "q", "r", "s", "u", "v", "w", "x", "y", "z"]
    let defaultAlpha = ["a", "n", "t", "i", "c"]
    
    let selected = combos(elements: ArraySlice(alpha), k: k-5)
    for i in selected {
        var each = 0
        var cnt = 0
        for j in defaultAlpha {
            each |= (1 << (ord(Character(j)) - ord("a")))
        }
        for j in i {
            each |= (1 << (ord(Character(j)) - ord("a")))
        }
        for j in words {
            if each & j == j {
                cnt += 1
            }
        }
        
        result = max(result, cnt)
    }
    return result
}

func ord(_ c: Character) -> Int {
    Int(c.asciiValue!)
}

func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = elements.first else {
        return []
    }

    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(), k: k)

    return ret
}
