//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/23.
//  오픈채팅방 카카오 Level2

import Foundation

typealias Message = (uid: String, content: String)

func solution(_ record:[String]) -> [String] {
    
    var user = [String:String]()
    var result = [Message]()
    
    for r in record {
        let log = r.split(separator: " ").map {String($0)}
        
        switch log[0] {
        case "Enter":
            user[log[1]] = log[2]
            result.append((log[1], "님이 들어왔습니다."))
        case "Leave":
            result.append((log[1], "님이 나갔습니다."))
        case "Change":
            user[log[1]] = log[2]
        default:
            continue
        }
    }
    
    return result.compactMap { user[$0.uid]!+$0.content }
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
