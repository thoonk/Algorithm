//
//  Q4101-bigger?.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/31.
//  크냐? / 구현

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = input[0]
    let b = input[1]
    
    if a == 0, b == 0 {
        break
    }
    
    print(a > b ? "Yes" : "No")
}
