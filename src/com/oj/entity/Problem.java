package com.oj.entity;
/** 
* @author ehanla E-mail:ehanla0@163.com 
* @version 创建时间:2018年12月14日 上午12:24:21 
* 类说明:关于问题的实体类
*/
public class Problem {
	private int id;
	private String content;
	private String A;
	private String B;
	private String C;
	private String D;
	private String ans;
	private String tag;
	private String level;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getA() {
		return A;
	}
	public void setA(String a) {
		A = a;
	}
	public String getB() {
		return B;
	}
	public void setB(String b) {
		B = b;
	}
	public String getC() {
		return C;
	}
	public void setC(String c) {
		C = c;
	}
	public String getD() {
		return D;
	}
	public void setD(String d) {
		D = d;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "Problem [id=" + id + ", content=" + content + ", A=" + A + ", B=" + B + ", C=" + C + ", D=" + D
				+ ", ans=" + ans + ", tag=" + tag + ", level=" + level + "]";
	}
	
}
