package com.baekjoon.gold;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Main_BJ_15685_G4_드래곤커브 {
	static int N, result;
	static int[] dy = {0, -1, 0, 1};
	static int[] dx = {1, 0, -1, 0};
	static int[][] board, copy;

	public static void main(String[] args) throws Exception{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st;
		N = Integer.parseInt(br.readLine());

		board = new int[101][101];

		for (int i = 0; i <N; i++) {
			st = new StringTokenizer(br.readLine());
			int y = Integer.parseInt(st.nextToken()), x = Integer.parseInt(st.nextToken());
			int d = Integer.parseInt(st.nextToken());
			int g = Integer.parseInt(st.nextToken());
			drawing(y, x, d, g);
		}
	}

	//copy된 배열을 회전, 복사합니다.
	static void turnCopy(){
		copy = new int[101][101];
		for (int i = 0; i < 101; i++) {
			for (int j = 0; j < 101; j++){
				copy[j][100-i] = board[i][j];
			}
		}
	}

	//배열을 출력하여 디버깅합니다.
	static void print(int[][] arr){
		for (int i = 0; i < 101; i++) {
			String str = "";
			for (int j = 0; j < 101; j++) {
				if(arr[i][j]>0) str += "1 ";
				else str += "0 ";
			}
			System.out.println(str);
		}
	}

	//드래곤 커브를 그립니다.
	static void drawing(int y, int x, int d, int g) {
		int gene = 0;
		while(gene<g){
			if(gene == 0){

			} else {

			}

			gene++;
		}
	}

	static void turn(){

	}

	//정사각형의 개수를 구합니다.
	static void cnt(){

	}
}
