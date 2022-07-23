//
//  Q2447.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/04.
//  별 찍기 - 10 / 재귀
/*
 그려보면서 언제 공백이 생기는지 규칙을 찾아서 적용
 그리고 출력 시간을 줄이기 위해 String 변수에 추가하여 한 번만 print()를 사용
 */

let n = Int(readLine()!)!
var res = ""

//func printStar(_ r: Int, _ c: Int) {
//    var r = r
//    var c = c
//    while r > 0 {
//        if r % 3 == 1 && c % 3 == 1 {
//            res += " "
//            return
//        }
//        r /= 3
//        c /= 3
//    }
//    res += "*"
//}

func printStar(_ r: Int, _ c: Int, _ n: Int) {
    if r % 3 == 1 && c % 3 == 1 {
        res += " "
    } else if n == 1 {
        res += "*"
    } else {
        printStar(r/3, c/3, n/3)
    }
}

for r in 0 ..< n {
    for c in 0 ..< n {
        printStar(r, c, n)
    }
    res += "\n"
}
print(res)
