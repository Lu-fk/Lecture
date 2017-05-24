package db;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.*;

public class DB{
	Connection con;
	Statement sql;
	ResultSet rs;
	
	public DB(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			System.out.println(e);
		}
		
		try{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Lecture?characterEncoding=utf-8","root","123456");
		}catch(SQLException e){
			System.out.println(e);
		}
	}
	
	public String stulog(String username,String pwd){//学生登陆
		String Name=null;
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("SELECT * FROM stu");
			for(;rs.next();){
				if(username.equals(rs.getString(1))){
					if(pwd.equals(rs.getString(2))){
						Name=rs.getString(3);
					}
					break;
				}
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return Name;
	}
	
	public String mgrlog(String username,String pwd){//管理员登陆
		String Name=null;
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("SELECT * FROM manager");
			for(;rs.next();){
				if(username.equals(rs.getString(1))){
					if(pwd.equals(rs.getString(2))){
						Name=(String) rs.getString(3);
					}
					break;
				}
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return Name;
	}
	
	public ArrayList<lecture> findAllLec(){//找到所有讲座
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lecture ORDER BY lec_date");
			ArrayList<lecture> al=new ArrayList<lecture>();
			while(rs.next()){
				lecture lec=new lecture();
				lec.setLec_id(rs.getString(1));
				lec.setLec_name(rs.getString(2));
				lec.setLecturer_id(rs.getString(3));
				SimpleDateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dt=form.parse(rs.getString(4));
				lec.setLec_date(dt);
				lec.setRoom_id(rs.getString(5));
				lec.setLec_mess(rs.getString(6));
				al.add(lec);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public lecture getLec(String Lec_id){//根据id找到讲座
		try{
			lecture lec=new lecture();
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lecture where lec_id='"+Lec_id+"'");
			if(rs.next()){
				lec.setLec_id(rs.getString(1));
				lec.setLec_name(rs.getString(2));
				lec.setLecturer_id(rs.getString(3));
				SimpleDateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dt=form.parse(rs.getString(4));
				lec.setLec_date(dt);
				lec.setRoom_id(rs.getString(5));
				lec.setLec_mess(rs.getString(6));
				return lec;
			}
			else return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public String getStu_nameForid(String Stu_id){//根据id找到学生名字
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select stu_name from stu where stu_id='"+Stu_id+"'");
			if(rs.next())
				return rs.getString(1);
			else return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<signTable> findSignTable(){//找到所有签到信息（及学生预约信息）
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from sign_in");
			ArrayList<signTable> al=new ArrayList<signTable>();
			while(rs.next()){
				signTable st=new signTable();
				st.setStu_id(rs.getString(1));
				st.setLec_id(rs.getString(2));
				st.setSign(rs.getInt(3));
				al.add(st);
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<comTable> findL_ComTable(String Lec_id){//根据lec_id找到该lec的评论
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lec_com where lec_id='"+Lec_id+"' ORDER BY com_date");
			ArrayList<comTable> al=new ArrayList<comTable>();
			while(rs.next()){
				comTable ct=new comTable();
				ct.setStu_id(rs.getString(1));
				ct.setLec_id(Lec_id);
				ct.setCom(rs.getString(3));
				SimpleDateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dt=form.parse(rs.getString(4));
				ct.setCom_date(dt);
				al.add(ct);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<comTable> findS_ComTable(String Stu_id){//根据stu_id找到该stu的评论
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lec_com where stu_id="+Stu_id+" ORDER BY com_date");
			ArrayList<comTable> al=new ArrayList<comTable>();
			while(rs.next()){
				comTable ct=new comTable();
				ct.setStu_id(Stu_id);
				ct.setLec_id(rs.getString(2));
				ct.setCom(rs.getString(3));
				SimpleDateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dt=form.parse(rs.getString(4));
				ct.setCom_date(dt);
				al.add(ct);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<room> getRoom(){//查询教室表
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lecroom");
			ArrayList<room> al=new ArrayList<room>();
			while(rs.next()){
				room rt=new room();
				rt.setRoom_id(rs.getString(1));
				al.add(rt);
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<lecturer> getLecturer(){//查询讲师表
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lecturer");
			ArrayList<lecturer> al=new ArrayList<lecturer>();
			while(rs.next()){
				lecturer lrt=new lecturer();
				lrt.setLecturer_id(rs.getString(1));
				lrt.setLecturer_name(rs.getString(2));
				al.add(lrt);
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public String getLecturername(String Lecturer_id){//根据l_id找到l_name
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select lecturer_name from lecturer where lecturer_id="+Lecturer_id);
			if(rs.next())
				return rs.getString(1);
			return null;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public int signcheck(String Stu_id,String Lec_id){//检查该stu是否已经预约该lec
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select sign from sign_in where stu_id="+Stu_id+" and lec_id="+Lec_id);
			if(rs.next())
				return rs.getInt(1);
			return 3;
		}catch(SQLException e){
			e.printStackTrace();
			return 3;
		}
	}
	
	public int apptimeLec(String Stu_id,String Lec_id){//stu预约lec
		try{
			sql=con.createStatement();
			sql.execute("insert into sign_in (stu_id,lec_id) values('"+Stu_id+"','"+Lec_id+"')");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int delapp (String Stu_id,String Lec_id){//stu取消预约lec
		try{
			sql=con.createStatement();
			sql.execute("delete from sign_in where stu_id='"+Stu_id+"' and lec_id='"+Lec_id+"'");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int Lec_idcheck(String Lec_id){//lec_id重复查询
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lecture where lec_id="+Lec_id);
			if(rs.next())
				return 1;
			return 0;
		}catch(SQLException e){
			e.printStackTrace();
			return 2;
		}
	}
	
	public int Lec_timecheck(String Room_id,String time){//lec的时间地点冲突查询
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from lecture where room_id="+Room_id+" and lec_date='"+time+"'");
			if(rs.next())
				return 1;
			return 0;
		}catch(SQLException e){
			e.printStackTrace();
			return 2;
		}
	}
	
	public int addLec(String Lec_id,String Lec_name,String Lecturer_id,String dt,String Room_id,String Lec_mess){//添加lec
		try{
			sql=con.createStatement();
			sql.execute("insert into lecture values('"+Lec_id+"','"+Lec_name+"','"+Lecturer_id+"','"+dt+"','"+Room_id+"','"+Lec_mess+"')");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int updateLec(String Lec_id,String Lec_name,String Lecturer_id,String dt,String Room_id,String Lec_mess){//修改lec
		try{
			sql=con.createStatement();
			sql.execute("update lecture set lec_name='"+Lec_name+"',lecturer_id='"+Lecturer_id+"',lec_date='"+dt+"',room_id='"+Room_id+"',lec_mess='"+Lec_mess+"' where lec_id="+Lec_id);
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int dellec(String Lec_id){//删除lec
		try{
			sql=con.createStatement();
			sql.execute("delete from lec_com where lec_id='"+Lec_id+"'");
			sql.execute("delete from sign_in where lec_id='"+Lec_id+"'");
			sql.execute("delete from lecture where lec_id='"+Lec_id+"'");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int addCom(String Stu_id,String Lec_id,String Com){//添加评论
		try{
			sql=con.createStatement();
			sql.execute("insert into lec_com (stu_id,lec_id,com) values('"+Stu_id+"','"+Lec_id+"','"+Com+"')");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int delCom(String Stu_id,String Lec_id,String Com_date){//删除评论
		try{
			sql=con.createStatement();
			sql.execute("delete from lec_com where stu_id='"+Stu_id+"'  and lec_id='"+Lec_id+"' and com_date='"+Com_date+"'");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int stu_idcheck(String id){//注册时id重复查询
		try{
			sql=con.createStatement();
			rs=sql.executeQuery("select * from stu where stu_id='"+id+"'");
			if(rs.next())
				return 1;
			else return 0;
		}
		catch(SQLException e){
			System.out.println(e);
			return 2;
		}
	}
	
	public int regist(String id,String pwd,String name){//注册
		try{
			sql=con.createStatement();
			sql.execute("insert into stu values('"+id+"','"+pwd+"','"+name+"')");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public int sign_in(String Stu_id,String Lec_id){//签到
		try{
			sql=con.createStatement();
			sql.execute("update sign_in set sign=1 where stu_id='"+Stu_id+"' and lec_id='"+Lec_id+"'");
			int res=sql.getUpdateCount();
			return res;
		}
		catch(SQLException e){
			System.out.println(e);
			return 0;
		}
	}
	
	public void Close(){//关闭连接
		try{con.close();}
		catch(SQLException e){
			System.out.println(e);
		}
	}
}