package com.company;

import java.util.Scanner;

public class BOJ10250 {

    public static void main(String[] args){
        int num;
        int H,W,N;
        int X, Y;
        Scanner sc = new Scanner(System.in);
        num = sc.nextInt();

        for(int i=0; i<num; i++) {
            H = sc.nextInt();
            W = sc.nextInt();
            N = sc.nextInt();
            Y = N % H;
            X = (N / H) + 1;
            if (N % H == 0) {
                Y = H;
                X = N / H;
            }
            System.out.println(Y * 100 + X);
        }
    }
}
