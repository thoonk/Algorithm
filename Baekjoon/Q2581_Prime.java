package com.company;

import java.util.Scanner;

public class BOJ2581 {

    public static boolean isPrime[];

    public static void main(String[] args){

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();

        isPrime = new boolean[m+1];
        checkPrime();

        // 소수의 합, 최솟값
        int sum = 0;
        int min = 10000001;
        for(int i = n; i <= m; i++){
            if(isPrime[i] == false){
                sum += i;
                if(min == 10000001){
                    min = i;
                }
            }
        }

        if(sum == 0) {
            System.out.println(-1);
        } else{
            System.out.println(sum);
            System.out.println(min);
        }


    }
    // 소수 구하는 메서드
    public static void checkPrime(){
        isPrime[0] = true;
        isPrime[1] = true;

        //에라토스테네스의 체 알고리즘
        for(int i = 2; i < Math.sqrt(isPrime.length); i++){
            for(int j=i*i; j < isPrime.length; j+=i){
                isPrime[j] = true;
            }
        }
    }
}
