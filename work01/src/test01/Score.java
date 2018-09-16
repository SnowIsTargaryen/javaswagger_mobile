package test01;

public class Score {
	private int no;
	private double kor;
	private double math;
	private double eng;
	private double avg;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public double getKor() {
		return kor;
	}
	public void setKor(double kor) {
		this.kor = kor;
	}
	public double getMath() {
		return math;
	}
	public void setMath(double math) {
		this.math = math;
	}
	public double getEng() {
		return eng;
	}
	public void setEng(double eng) {
		this.eng = eng;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public Score() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Score(int no, double kor, double math, double eng, double avg) {
		super();
		this.no = no;
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.avg = avg;
	}
}
