//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/01.
//  스위치 켜고 끄기 구현

func switching() {
    for i in 0..<studentNum {
        let sex = students[i][0]
        let index = students[i][1]
        // 남학생
        if sex == 1 {
            for j in stride(from: index, to: switchNum+1, by: index) {
                switchStatus[j] = switchStatus[j] == 0 ? 1 : 0
            }
        }
        // 여학생
        else if sex == 2 {
            switchStatus[index] = switchStatus[index] == 0 ? 1 : 0
            
            for j in 0..<switchNum / 2 {
                if index + j > switchNum || index - j <= 0 {
                    break
                }
                
                if switchStatus[index + j] == switchStatus[index - j] {
                    switchStatus[index + j] = switchStatus[index + j] == 0 ? 1 : 0
                    switchStatus[index - j] = switchStatus[index - j] == 0 ? 1 : 0
                } else {
                    break
                }
            }
        }
    }
}

let switchNum = Int(readLine()!)!
var switchStatus = readLine()!.split(separator: " ").map { Int(String($0))! }
switchStatus.insert(-1, at: 0)
let studentNum = Int(readLine()!)!
var students = [[Int]]()
var result = 0

for _ in 0..<studentNum {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    students.append(input)
}

switching()

for i in 1..<switchNum+1 {
    print(switchStatus[i], terminator: " ")
    if i % 20 == 0 {
        print("")
    }
}

