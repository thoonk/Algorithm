//
//  main .swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/06.
//  에디터 / 스택

// 배열 풀이 시간초과
//var left = Array(readLine()!.map { String($0) })
//var right = [String]()
//let m = Int(readLine()!)!
//
//for _ in 0 ..< m {
//    let input = readLine()!.split(separator: " ").map { String($0) }
//    let cmd = input[0]
//
//    if cmd == "L", !left.isEmpty {
//        right.append(left.removeLast())
//    } else if cmd == "D", !right.isEmpty {
//        left.append(right.removeLast())
//    } else if cmd == "B", !left.isEmpty {
//        left.removeLast()
//    } else if cmd == "P" {
//        left.append(input[1])
//    }
//}
//
//
//print((left + Array(right.reversed())).joined())


// switch version
var left = readLine()!
var right = ""
let m = Int(readLine()!)!

for _ in 0 ..< m {
    let cmd = readLine()!

    switch cmd {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(cmd.last!)
    }
}

print(left + right.reversed())

// if version
//var left = readLine()!
//var right = ""
//
//for _ in 0 ..< Int(readLine()!)! {
//    let cmd = readLine()!
//    if cmd == "L", !left.isEmpty {
//        right.append(left.removeLast())
//    } else if cmd == "D", !right.isEmpty {
//        left.append(right.removeLast())
//    } else if cmd == "B" {
//        left.popLast()
//    } else {
//        left.append(cmd.last!)
//    }
//}
//
//print(left + right.reversed())
