//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/07.
//  Q10825 국영수 정렬

import Foundation

struct Student : Comparable {
    
    var name: String
    var korean: Int
    var english: Int
    var math: Int
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        if lhs.korean == rhs.korean {
            if lhs.english == rhs.english {
                if lhs.math == rhs.math {
                    return lhs.name < rhs.name
                } else if lhs.math > rhs.math {
                    return true
                }
            } else if lhs.english < rhs.english {
                return true
            }
        } else if lhs.korean > rhs.korean {
            return true
        }
        return false
    }
}

func solution() {
    
    let n = Int(readLine()!)!
    var grade = [Student]()
    
    for _ in 0 ..< n {
        let arr = readLine()!.split(separator: " ").map {String($0)}
        grade.append(Student(name: arr[0], korean: Int(arr[1])!, english: Int(arr[2])!, math: Int(arr[3])!))
    }

    grade = grade.sorted(by: <)
    
    for i in 0 ..< n {
        print(grade[i].name)
    }
}

solution()
