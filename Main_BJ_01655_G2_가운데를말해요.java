package com.baekjoon.gold;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Main_BJ_01655_G2_가운데를말해요 {
	public static void main(String[] args) throws Exception{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());

		PriorityQueue<Integer> down = new PriorityQueue<>(Collections.reverseOrder());
		PriorityQueue<Integer> up = new PriorityQueue<>();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < n; i++) {
			int now = Integer.parseInt(br.readLine());
			//개수가 같다면
			if(up.size() == down.size()){
				down.add(now);
			} else {
				up.add(now);
			}

			if(!up.isEmpty() && !down.isEmpty()){
				if(up.peek() < down.peek()){
					int tmp = up.poll();
					up.add(down.poll());
					down.add(tmp);
				}
			}

			sb.append(down.peek()+"\n");
		}
		System.out.println(sb.toString().trim());
	}
}