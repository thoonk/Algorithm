//
//  Q2745-calculationOfGrade.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/01.
//  학점 계산 / 구현, 문자열

let grades: [String: Double] = [
    "A+": 4.3,
    "A0": 4.0,
    "A-": 3.7,
    "B+": 3.3,
    "B0": 3.0,
    "B-": 2.7,
    "C+": 2.3,
    "C0": 2.0,
    "C-": 1.7,
    "D+": 1.3,
    "D0": 1.0,
    "D-": 0.7,
    "F": 0.0,
]

print(grades[readLine()!]!)
