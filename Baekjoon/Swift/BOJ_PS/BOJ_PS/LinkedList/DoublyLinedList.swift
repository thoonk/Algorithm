//
//  DoublyLinedList.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/09/03.
//  야매 이중 연결 리스트

let MAX_SIZE = 1000005
var data = [Int](repeating: -1, count: MAX_SIZE)
var pre = [Int](repeating: -1, count: MAX_SIZE)
var next = [Int](repeating: -1, count: MAX_SIZE)
var cur = 1

func traverse() {
    var cur = next[0]
    while(cur != -1) {
        print(data[cur], terminator: " ")
        cur = next[cur]
    }
    print()
}

// addr: 삽입할 위치의 주소, num: 삽입할 데이터
func insert(at addr: Int, num: Int) {
    // 1. 새로운 원소 생성
    data[cur] = num
    // 2. 새 원소의 pre 값에 삽입할 위치의 주소를 대입
    pre[cur] = addr
    // 3. 새 원소의 next 값에 삽입할 위치의 next 값을 대입
    next[cur] = next[addr]
    // 4. 삽입할 위치의 다음 원소의 pre 값을 새 원소로 변경
    if next[addr] != -1 { // 삽입할 위치의 다음 데이터가 없지 않다면
        pre[next[addr]] = cur
    }
    // 5. 삽입할 위치의 next 값 변경
    next[addr] = cur
    // 6. 다음 데이터를 저장할 현재 인덱스 증가
    cur += 1
}
// addr: 삭제할 위치의 주소
func remove(at addr: Int) {
    // 1. 이전 위치의 next를 삭제할 위치의 next로 변경
    next[pre[addr]] = next[addr]
    // 2. 다음 위치의 pre를 삭제할 위치의 pre로 변경
    if next[addr] != -1 {
        pre[next[addr]] = pre[addr]
    }
}

func insertTest() {
    print("--------Inserting Test-------")
    insert(at: 0, num: 10)
    traverse()
    insert(at: 0, num: 30)
    traverse()
    insert(at: 2, num: 40)
    traverse()
    insert(at: 1, num: 20)
    traverse()
    insert(at: 4, num: 70)
    traverse()
}

func removeTest() {
    print("--------Removing Test-------")
    remove(at: 1)
    traverse()
    remove(at: 2)
    traverse()
    remove(at: 4)
    traverse()
    remove(at: 5)
    traverse()
}

insertTest()
print()
removeTest()
