package com.ridebuddies.user;

import com.ridebuddies.db.DbData;
import com.ridebuddies.ridecreator.RideDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class UserDao {

	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	
	@SuppressWarnings("finally")
	public boolean addUser(UserDto dto) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Insert into User(name,email,phone,password,gender) values(?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getPassword());
			ps.setString(5, dto.getGender());
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in addUser : e");
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public UserDto authenticate(String phone,String password) {
		UserDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Select * from User where phone = ? and password = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, phone);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new UserDto();
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setPassword(rs.getString("password"));
				dto.setGender(rs.getString("gender"));
				dto.setReqRat(rs.getInt("reqrat"));
				dto.setRideRat(rs.getInt("riderat"));
			}
		} catch (Exception e) {
			System.out.println("Exception in authenticate : "+e);
		} finally {
			ps= null;
			rs = null;
			con = null;
			return dto;
		}
	}
	
	@SuppressWarnings("finally")
	public UserDto viewUser(String phone) {
		UserDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from User where phone = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new UserDto();
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setReqRat(rs.getInt("reqrat"));
				dto.setRideRat(rs.getInt("riderat"));
			}
		} catch (Exception e) {
			System.out.println("Exception in viewUser : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return dto;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean updateUser(UserDto user) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "update User set email=?,name=?,gender=? where phone = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, user.getEmail() );
			ps.setString(2, user.getName());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getPhone());
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in updateUser : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean deleteUser(String phone) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "delete from User where phone=?";
			ps = con.prepareStatement(query);
			ps.setString(1,phone );
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteUser : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean rideRat(String phone,int rat) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select riderat from User where phone=?";
			ps = con.prepareStatement(query);
			ps.setString(1,phone );
			rs = ps.executeQuery();
			int riderat = 0;
			while(rs.next()) {
				riderat = rs.getInt("riderat");
			}
			riderat = (riderat+rat)/2;
			query = "update User set riderat=? where phone=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, riderat);
			ps.setString(2, phone);
			if(ps.executeUpdate()>0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in rideRat : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean reqRat(String phone,int rat) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select reqrat from User where phone=?";
			ps = con.prepareStatement(query);
			ps.setString(1,phone );
			rs = ps.executeQuery();
			int reqrat = 0;
			while(rs.next()) {
				reqrat = rs.getInt("reqrat");
			}
			reqrat = (reqrat+rat)/2;
			query = "update User set reqrat=? where phone=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, reqrat);
			ps.setString(2, phone);
			if(ps.executeUpdate()>0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in reqRat : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return flag;
		}
	}
	
	public static void main(String[] args) {
		/*UserDto dto = new UserDto();
		dto.setName("Sanjeet");
		dto.setEmail("sanjeet.shannonitu25@gmail.com");
		dto.setPhone("8987045110");
		dto.setPassword("sanjeet");*/
		
		UserDto dto = new UserDao().authenticate("8987045110", "sanjeet");
		System.out.println(dto.getName());
	}
}
