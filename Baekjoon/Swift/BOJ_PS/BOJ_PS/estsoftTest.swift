//
//  estsoftTest.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/28.
//

func findMatch(index: Int, p: [String], s: [String]) -> Int {
    // i: s의 인덱스
    var i = index
    // j: p의 인덱스
    var j = 0
    // p와 일치하는 문자열의 개수
    var matchCount = 0
    
    while i < s.count {
        // 문자열이 일치하면
        if p[j] == s[i] {
            // p의 문자열을 다 탐색했을 때
            if j == p.count-1 {
                matchCount += 1
                j = 0
            } else {
                j += 1
            }
        }
        // 문자열이 일치하지 않다면 다시 초기화
        else {
            j = 0
        }
        i += 1
    }
    return matchCount
}

func solution(_ p:String, _ s:String) -> Int {
    var p = Array(p).map { String($0) }
    var s = Array(s).map { String($0) }
    var res = 0
    
    for i in 0 ..< s.count {
        let count = findMatch(index: i, p: p, s: s)
        res = max(res, count)
    }
    // 일치하는 문자열이 없으면 -1을 리턴하고 있다면 s의 개수에서 매칭개수와 p의 개수를 곱한걸 빼서
    // 삭제할 최소 문자열의 개수를 구한다.
    return res == 0 ? -1 : s.count - (res * p.count)
}

print(solution("101", "10100010101101100"))
