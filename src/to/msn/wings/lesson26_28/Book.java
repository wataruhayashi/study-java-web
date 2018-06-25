package to.msn.wings.lesson26_28;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Book implements Serializable {
	public Book() { /* コンストラクター */ }

	private String isbn;
	public void setIsbn(String isbn) { this.isbn = isbn; }
	public String getIsbn() { return this.isbn; }

	private String title;
	public void setTitle(String title) { this.title = title; }
	public String getTitle() { return this.title; }

	private int price;
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
	public int getPrice(){ return this.price; }

	private String publish;
	public void setPublish(String publish) { this.publish = publish; }
	public String getPublish() { return this.publish; }

	private Date published;
	public void setPublished(String published) {
		try {
			SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
			this.published = dformat.parse(published);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public Date getPublished() { return this.published; }

	public int insertInfo() {
		int result = 0;
		Connection db = null;
		PreparedStatement ps =null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
			db = ds.getConnection();
			ps = db.prepareStatement("INSERT INTO books(isbn, title, price, publish, published) VALUES(?, ?, ?, ?, ?)");
			ps.setString(1, this.isbn);
			ps.setString(2, this.title);
			ps.setInt(3, this.price);
			ps.setString(4, this.publish);
			ps.setDate(5, new java.sql.Date(this.published.getTime()));
			result = ps.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) { ps.close(); }
				if(db != null) { db.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static ArrayList<Book> getInfos(){
		ArrayList<Book> list = new ArrayList<Book>();
		Connection db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
			db = ds.getConnection();
			ps = db.prepareStatement("SELECT * FROM books ORDER BY published DESC");
			rs = ps.executeQuery();
			while(rs.next()) {
				Book info = new Book();
				info.setIsbn(rs.getString("isbn"));
				info.setTitle(rs.getString("title"));
				info.setPrice(rs.getString("price"));
				info.setPublish(rs.getString("publish"));
				info.setPublished(rs.getString("published"));
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

	public static Book getInfo(String isbn) {
		Book info = null;
		Connection db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
			db = ds.getConnection();
			ps = db.prepareStatement("SELECT * FROM books WHERE isbn=?");
			ps.setString(1, isbn);
			rs = ps.executeQuery();
			if(rs.next()) {
				info = new Book();
				info.setIsbn(rs.getString("isbn"));
				info.setTitle(rs.getString("title"));
				info.setPrice(rs.getString("price"));
				info.setPublish(rs.getString("publish"));
				info.setPublished(rs.getString("published"));
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
		return info;
	}
}
