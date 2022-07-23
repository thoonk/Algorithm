//
//  Q10814.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/28.
//  나이순 정렬 / 정렬

typealias Person = (age: Int, name: String)

var person = [Person]()
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    person.append((Int(input[0])!, input[1]))
}

person.sort { $0.age < $1.age }
person.forEach {
    print($0.age, $0.name)
}
