//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/14.
//  Q1946 신입사원 그리디 시간초과

import Foundation
processTime{
    let T = Int(readLine()!)!
    
    for _ in 0 ..< T {
        
        let n = Int(readLine()!)!
        var applicant = Array(repeating: 0, count: n+1)
        for _ in 0 ..< n {
            let person = readLine()!.split(separator: " ").map {Int(String($0))!}
            applicant[person[0]] = person[1]
        }
        
        var bestInterview = applicant[1]
        var cnt = 1
        
        for i in 2 ..< n+1 {
            if applicant[i] < bestInterview {
                bestInterview = applicant[i]
                cnt += 1
            }
        }
        print(cnt)
    }
}
func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: \(processTime)")
}


/*
 let T = Int(readLine()!)!
 
 for _ in 0 ..< T {
 
 let n = Int(readLine()!)!
 var applicant = [(Int, Int)]()
 for _ in 0 ..< n {
 let person = readLine()!.split(separator: " ").map {Int(String($0))!}
 applicant.append((person[0], person[1]))
 }
 applicant.sort(by: { $0.0 < $1.0 })
 //print(applicant)
 var isFail = Array(repeating: false, count: n)
 for i in 0 ..< n {
 for j in 1 ..< n {
 if applicant[i].0 < applicant[j].0 && applicant[i].1 < applicant[j].1 {
 isFail[j] = true
 }
 }
 }
 print(isFail.filter { $0 == false }.count)
 }
 */
