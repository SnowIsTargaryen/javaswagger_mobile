package test01;

import java.util.ArrayList;
import java.util.Scanner;

public class Test01 {
	public static void main(String []args) {
		int no = 1;
		ArrayList<Score> list = new ArrayList<Score>();
		Scanner scanf = new Scanner(System.in);
		System.out.println("*** 평 균 성 적 순 위 계 산 기 ***");
		while(true) {
			int num = menu(scanf);
			if(num >= 1 && num <= 4) {
				switch(num) {
					case 1: check(list); break;
					case 2: if(no > 10) {System.out.println("입력 가능한 학생의 수를 초과하였습니다.");} else {Score s = input(scanf, no); list.add(s); no++;}; break;
					case 3: rank(list); break;
					case 4: list.clear(); System.out.println("입력 정보가 초기화 되었습니다."); no = 1; break;
				}
			} else if(num == 5) {
				System.out.println("프로그램을 종료합니다.");
				break;
			} else {
				System.out.println("존재하지 않는 메뉴입니다.");
			}
		}
	}
	
	public static int menu(Scanner scanf) {
		System.out.println("메뉴를 선택하세요. (1. 조회 / 2. 입력 / 3. 순위/ 4. 초기화/ 5. 종료)");
		int num = scanf.nextInt();
		return num;
	}
	
	public static void check(ArrayList<Score> list) {
		if(list.isEmpty()) {
			System.out.println("입력된 점수가 없습니다.");
		} else {
			System.out.println("번호\t국어\t수학\t영어\t평균");
			for(int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getNo()+"\t"+list.get(i).getKor()+"\t"+list.get(i).getMath()+"\t"+list.get(i).getEng()+"\t"+list.get(i).getAvg());
			}
		}
		return;
	}
	
	public static Score input(Scanner scanf, int no) {
		Score s = new Score();
		System.out.println(no + "번 학생의 국어 점수 : ");
		double kor = scanf.nextDouble();
		System.out.println(no + "번 학생의 수학 점수 : ");
		double math = scanf.nextDouble();
		System.out.println(no + "번 학생의 영어 점수 : ");
		double eng = scanf.nextDouble();
		s.setNo(no);
		s.setKor(kor);
		s.setMath(math);
		s.setEng(eng);
		s.setAvg((kor + math + eng)/3);
		return s;
	}
	
	@SuppressWarnings("unchecked")
	public static void rank(ArrayList<Score> list) {
		ArrayList<Score> listt = (ArrayList<Score>) list.clone();
		if(list.isEmpty()) {
			System.out.println("입력된 점수가 없습니다.");
		} else {
			System.out.println("순위\t번호\t평균");
			for(int i = 0; i < listt.size() - 1; i++) {
				for(int j = i + 1; j < listt.size(); j++) {
					if(listt.get(j).getAvg() > listt.get(i).getAvg()) {
						Score temp = listt.get(j);
						listt.set(j, listt.get(i));
						listt.set(i, temp);
					}
				}
			}

			for(int i = 0; i < listt.size(); i++) {
				System.out.println((i+1) + "\t" + listt.get(i).getNo() + "\t" + listt.get(i).getAvg());
			}
		}
		return;
	}
}
