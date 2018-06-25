package to.msn.wings.lesson26_28;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Schedule implements Serializable {
	public Schedule(){ /* コンストラクター */ }

	private String id;
	public void setId(String id) { this.id = id; }
	public String getId() { return this.id; }

	private String title;
	public void setTitle(String title) { this.title = title; }
	public String getTitle() { return this.title; }

	private String scheduleDate;
	public void setScheduleDate(String scheduleDate) { this.scheduleDate = scheduleDate; }
	public String getScheduleDate() { return this.scheduleDate; }

	private String scheduleTime;
	public void setScheduleTime(String scheduleTime) { this.scheduleTime = scheduleTime; }
	public String getScheduleTime() { return this.scheduleTime; }

	private String memo;
	public void setMemo(String memo) { this.memo = memo; }
	public String getMemo() { return this.memo; }

	public int insertInfo() {
		int result = 0;
		Connection db = null;
		PreparedStatement ps =null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
			db = ds.getConnection();
			ps = db.prepareStatement("INSERT INTO schedules(title, schedule_date, schedule_time, memo) VALUES(? ,? ,? ,?)");
			ps.setString(1, this.title);
			ps.setString(2, this.scheduleDate);
			ps.setString(3, this.scheduleTime);
			ps.setString(4, this.memo);
			result = ps.executeUpdate();
			ps.close();
			db.close();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) { ps.close(); }
				if(db!=null) { db.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static ArrayList<Schedule> getInfos() {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		Connection db = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
			db = ds.getConnection();
			ps = db.prepareStatement("SELECT * FROM schedules ORDER BY schedule_date, schedule_time");
			rs = ps.executeQuery();
			while(rs.next()) {
				Schedule info = new Schedule();
				info.setId(rs.getString("id"));
				info.setTitle(rs.getString("title"));
				info.setScheduleDate(rs.getString("schedule_date"));
				info.setScheduleTime(rs.getString("schedule_time"));
				info.setMemo(rs.getString("memo"));
				list.add(info);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) { rs.close(); }
				if(ps != null) { ps.close(); }
				if(db != null) { db.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
