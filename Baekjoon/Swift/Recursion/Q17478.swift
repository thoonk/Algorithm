//
//  Q17478.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/24.
//  재귀함수가 뭔가요? / 재귀

let n = Int(readLine()!)!
print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")

func printUnderbar(_ cnt: Int) {
    for _ in 0 ..< cnt {
        print("____", terminator: "")
    }
}

func recursion(_ cnt: Int) {
    printUnderbar(cnt)
    print("\"재귀함수가 뭔가요?\"")

    if cnt == n {
        printUnderbar(cnt)
        print("\"재귀함수는 자기 자신을 호출하는 함수라네\"")
    } else {
        printUnderbar(cnt)
        print("\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.")
        printUnderbar(cnt)
        print("마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.")
        printUnderbar(cnt)
        print("그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"")
        recursion(cnt+1)
    }
    printUnderbar(cnt)
    print("라고 답변하였지.")
}
recursion(0)