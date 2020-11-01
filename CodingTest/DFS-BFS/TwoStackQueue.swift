//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/31.
//  Two Stack 이용한 Queue 구현

import Foundation
 
var rightArray = [Int]()
var leftArray = [Int]()

rightArray.append(1)
rightArray.append(2)
rightArray.append(3)
rightArray.append(4)

leftArray = Array(rightArray.reversed())
leftArray.popLast()
print(leftArray)

