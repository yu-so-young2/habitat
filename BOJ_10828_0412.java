package BOJ;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;
import java.util.StringTokenizer;

public class BOJ_10828_0412 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());
		Stack<Integer> stack = new Stack<>();
		
		for(int i=0;i<n;i++) {
			String cmd = br.readLine(); // 띄어쓰기 포함
			StringTokenizer st = new StringTokenizer(cmd);
			
			switch(st.nextToken()) {
			case "push":
				int tmp = Integer.parseInt(st.nextToken());
				stack.push(tmp);
				break;
			case "pop":
				if(stack.size()!=0) {
					System.out.println(stack.pop());
				}else {
					System.out.println(-1);
				}
				break;
			case "size":
				System.out.println(stack.size());
				break;
			case "empty":
				if(stack.size()==0) {
					System.out.println(1);
				}else {
					System.out.println(0);
				}
				break;
			case "top":
				if(stack.size()==0) {
					System.out.println(-1);
				}else {
					System.out.println(stack.peek());					
					
				}
				break;
			}
		}
		
		
	}
}
