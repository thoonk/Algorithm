//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/27.
//  트리 순회 재귀

struct Node {
    var data: String
    var left: String
    var right: String
    
    init(_ data: String, _ left: String, _ right: String) {
        self.data = data
        self.left = left
        self.right = right
    }
}

let n = Int(readLine()!)!
var tree = [String: Node]()
solution()

func solution() {
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        tree[input[0]] = Node(input[0], input[1], input[2])
    }
    preorder(node: tree["A"]!)
    print()
    inorder(node: tree["A"]!)
    print()
    postorder(node: tree["A"]!)
}

// 전위순회
func preorder(node : Node) {
    guard node.data != "." else { return }
    print(node.data, terminator: "")
    
    if node.left != "." {
        preorder(node: tree[node.left]!)
    }
    
    if node.right != "." {
        preorder(node: tree[node.right]!)
    }
}

// 중위순회
func inorder(node: Node) {
    guard node.data != "." else { return }
    
    if node.left != "." {
        inorder(node: tree[node.left]!)
    }
    
    print(node.data, terminator: "")
    
    if node.right != "." {
        inorder(node: tree[node.right]!)
    }
}

// 후위순회
func postorder(node: Node) {
    guard node.data != "." else { return }
    
    if node.left != "." {
        postorder(node: tree[node.left]!)
    }
    
    if node.right != "." {
        postorder(node: tree[node.right]!)
    }
    
    print(node.data, terminator: "")
}
