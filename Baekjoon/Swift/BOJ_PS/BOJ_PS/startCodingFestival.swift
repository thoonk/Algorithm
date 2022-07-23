//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/20.
//

import Foundation

// 1번
//typealias Time = (hour: Int, minute: Int)
//
//let n = Int(readLine()!)!
//var departureTime = [Time]()
//var arrivalTime = [Time]()
//
//for _ in 0..<n {
//    let input = readLine()!.split(separator: " ").map { String($0) }
//    let depart = input[0].split(separator: ":").map { Int(String($0))! }
//    let arrive = input[2].split(separator: ":").map { Int(String($0))! }
//
//    departureTime.append((depart[0], depart[1]))
//    arrivalTime.append((arrive[0], arrive[1]))
//}
//
//departureTime.sort { e1, e2 in
//    e1.hour == e2.hour ? e1.minute > e2.minute : e1.hour > e2.hour
//}
//
//arrivalTime.sort { e1, e2 in
//    e1.hour == e2.hour ? e1.minute < e2.minute : e1.hour < e2.hour
//}
//
//print(departureTime)
//print(arrivalTime)
//
//var departHour = String(departureTime.first!.hour)
//var departMin = String(departureTime.first!.minute)
//var arriveHour = String(arrivalTime.first!.hour)
//var arriveMin = String(arrivalTime.first!.minute)
//
//if count(departHour) == 1 {
//    departHour = "0\(departHour)"
//}
//if count(departMin) == 1 {
//    departMin = "0\(departMin)"
//}
//if count(arriveHour) == 1 {
//    arriveHour = "0\(arriveHour)"
//}
//if count(arriveMin) == 1 {
//    arriveMin = "0\(arriveMin)"
//}
//
//if departureTime.first!.hour > arrivalTime.first!.hour {
//    print("-1")
//} else {
//    print("\(departHour):\(departMin) ~ \(arriveHour):\(arriveMin)")
//}
//
//func count(_ n: String) -> Int {
//    let count = Array(n).count
//    return count
//}


//let input = Int(readLine()!)!
//var home = [[Int]]()
//
//
//for _ in 0..<input {
//    let input = Array(readLine()!).map { Int(String($0))! }
//    home.append(input)
//}
//
//print(home)
//
//func bfs() {
//
//}

///////////////////////////////

//typealias Contents = (reading: String, genre: String, row: Int, col: Int)
//
//let genreDefault = ["A","B","C","D","E"]
//let preference = readLine()!.split(separator: " ").map { Double(String($0))! }
//var preferDict = [String: Double]()
//let sortedDict = preferDict.sorted { $0.value > $1.value}
//
//for i in preference.indices {
//    preferDict[genreDefault[i]] = preference[i]
//}
//print(preferDict)
//let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = nm[0]
//let m = nm[1]
//
//var reading = [[String]]()
//var genre = [[String]]()
//
//for _ in 0..<n {
//    reading.append(Array(readLine()!).map { String($0) })
//}
//
//for _ in 0..<n {
//    genre.append(Array(readLine()!).map { String($0) })
//}
//print(reading, genre)
//
//var contents = [[Contents]](repeating: [Contents](repeating: ("","",0,0), count: m), count: n)
//for i in 0..<n {
//    for j in 0..<m {
//        contents[i][j] = (reading[i][j], genre[i][j], i, j)
//    }
//}
//
//print(contents)
//
//let sorted = contents.flatMap { $0 }
//    .sorted { e1, e2 in
//        e1.reading
//    }
//
