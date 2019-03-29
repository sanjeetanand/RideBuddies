package com.ridebuddies.ridecreator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ridebuddies.db.DbData;
import com.ridebuddies.riderequestor.RequestDto;

public class RideDao {

	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;

	@SuppressWarnings("finally")
	public boolean createRide(RideDto dto) {
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Insert into Ride(endCood,startCood,endLoc,mobile,phone,startLoc,vehType,endTime,startTime,people,price) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1,dto.getEndCood());
			ps.setString(2,dto.getStartCood());
			ps.setString(3,dto.getEndLoc());
			ps.setString(4,dto.getMobile());
			ps.setString(5,dto.getPhone());
			ps.setString(6,dto.getStartLoc());
			ps.setString(7,dto.getVehType());
			ps.setInt(8,dto.getEndTime());
			ps.setInt(9,dto.getStartTime());
			ps.setInt(10,dto.getPeople());
			ps.setInt(11, dto.getPrice());
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in createRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean deleteRide(String phone) {
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "delete from Ride where phone = ?";
			ps = con.prepareStatement(query);
			ps.setString(1,phone);
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public ArrayList<RideDto> viewAllRide() {
		ArrayList<RideDto> list = new ArrayList<>();
		RideDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from Ride";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new RideDto();
				dto.setEndCood(rs.getString("endCood"));
				dto.setStartCood(rs.getString("startCood"));
				dto.setEndLoc(rs.getString("endLoc"));
				dto.setEndTime(rs.getInt("endTime"));
				dto.setMobile(rs.getString("mobile"));
				dto.setPeople(rs.getInt("people"));
				dto.setPhone(rs.getString("phone"));
				dto.setStartLoc(rs.getString("startLoc"));
				dto.setStartTime(rs.getInt("startTime"));
				dto.setVehType(rs.getString("vehType"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception in viewAllRide : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return list;
		}
	}
	
	@SuppressWarnings("finally")
	public RideDto viewRide(String phone) {
		RideDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from Ride where phone = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new RideDto();
				dto.setEndLoc(rs.getString("endLoc"));
				dto.setEndTime(rs.getInt("endTime"));
				dto.setEndCood(rs.getString("endCood"));
				dto.setStartCood(rs.getString("startCood"));
				dto.setMobile(rs.getString("mobile"));
				dto.setPeople(rs.getInt("people"));
				dto.setPhone(rs.getString("phone"));
				dto.setStartLoc(rs.getString("startLoc"));
				dto.setStartTime(rs.getInt("startTime"));
				dto.setVehType(rs.getString("vehType"));
				dto.setPrice(rs.getInt("price"));
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteRide : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return dto;
		}
	}
	
	@SuppressWarnings("finally")
	public ArrayList<RideDto> searchRide(String origin,String dest){
		ArrayList<RideDto> list = new ArrayList<>();
		RideDto dtoo = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Select * from Ride where startLoc=? || endLoc=?";
			ps = con.prepareStatement(query);
			ps.setString(1, origin);
			ps.setString(2, dest);
			rs= ps.executeQuery();
			while(rs.next()) {
				dtoo = new RideDto();
				dtoo.setEndLoc(rs.getString("endLoc"));
				dtoo.setEndTime(rs.getInt("endTime"));
				dtoo.setEndCood(rs.getString("endCood"));
				dtoo.setStartCood(rs.getString("startCood"));
				dtoo.setMobile(rs.getString("mobile"));
				dtoo.setPeople(rs.getInt("people"));
				dtoo.setPhone(rs.getString("phone"));
				dtoo.setStartLoc(rs.getString("startLoc"));
				dtoo.setStartTime(rs.getInt("startTime"));
				dtoo.setVehType(rs.getString("vehType"));
				dtoo.setPrice(rs.getInt("price"));
				list.add(dtoo);
			}
		} catch (Exception e) {
			System.out.println("Exception in searchRide : "+e);
		} finally {
			rs= null;
			ps = null;
			con = null;
			return list;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean completeRide(String creater,String requester) {
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Insert into CompletedRide(creater,requester) values(?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, creater);
			ps.setString(2, requester);
			if(ps.executeUpdate()>0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in completeRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(new RideDao().viewRide("8987045110"));
	}
}
