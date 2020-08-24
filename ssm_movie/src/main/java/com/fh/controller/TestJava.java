package com.fh.controller;

public class TestJava {
    public static void main(String[] args) {
        int[][] a={{1,2,3},{4,5,6},{7,8,9}};
            int i,j,s=0; for(i=0;i<3;i++)
            for(j=0;j<i+1;j++)
                s=s+a[2-i][2-j]; System. out. println(s);
    }
}
