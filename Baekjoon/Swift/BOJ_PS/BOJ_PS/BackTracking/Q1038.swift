//
//  Q1038.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/18.
//  감소하는 수 / 백트래킹

let n = Int(readLine()!)!
var nums = [Int]()

// 0~10의 수와 자릿수를 이용해서 감소하는 수를 찾아 배열에 넣는다.
func findDesc(_ index: Int, _ digit: Int, _ num: Int) {
    var num = num
    for i in index ..< 10 {
        num += i * digit
        nums.append(num)
        findDesc(i + 1, digit * 10, num)
        num -= i * digit
    }
}

func solution() {
    // 0 ~ 10은 감소하는 수이다.
    guard n > 10 else {
        print(n)
        return
    }
    // n이 1023이면 범위를 초과한다.
    if n > 1022 {
        print(-1)
        return
    } else {
        findDesc(0, 1, 0)
        if nums.count <= n {
            print(-1)
            return
        }
        nums.sort()
        print(nums[n])
    }
}
solution()
