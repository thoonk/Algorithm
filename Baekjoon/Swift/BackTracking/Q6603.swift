//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/08.
//  로또 / 백트래킹, 순열

func selectNums(_ cnt: Int, _ index: Int, _ nums: [Int], _ selected: inout [Bool]) {
    if cnt == 6 {
        for i in 0 ..< selected.count {
            if selected[i] == true {
                print(nums[i], terminator: " ")
            }
        }
        print()
        return
    }
    
    guard index < nums.count else { return }
    selected[index] = true
    selectNums(cnt+1, index+1, nums, &selected)
    selected[index] = false
    selectNums(cnt, index+1, nums, &selected)
}

while let nums = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
    if nums.count == 1, nums[0] == 0 {
        break
    }
    
    let n = [Int](nums.dropFirst())
    var selected = [Bool](repeating: false, count: n.count)
    selectNums(0, 0, n, &selected)
    print()
}

