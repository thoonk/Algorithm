//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/23.
//

import Foundation

var T = Int(readLine()!)!

for _ in 0..<T{
    
    let n = Int(readLine()!)!
    guard n > 2, n % 2 == 0 else { break }
    
    let isPrime: [Bool] = checkPrime(n)
    var prime1 = n/2
    var prime2 = n/2
    
    while(true){
        if prime1 + prime2 == n, !isPrime[prime1], !isPrime[prime2]{
            print(prime1, prime2)
            break;
        }

        prime1 -= 1;
        prime2 += 1;
    }
}


func checkPrime(_ n: Int) -> [Bool] {

    var isPrime = Array.init(repeating: false, count: n + 1)
    isPrime[0] = true
    isPrime[1] = true
    
    for i in 2...n {
        if(isPrime[i] == false){
            var j = i*i
            while(j <= n){
                isPrime[j] = true
                j += i
            }
        }
    }
    return isPrime
}

