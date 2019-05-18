package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class connect
{
	public static Connection dbcon()
	{
		Connection con=null;
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/spydarr";
		String username="root";
		String password="";
		
		try
		{
			Class.forName(driver);
			try
			{
				con=DriverManager.getConnection(url,username,password);
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return con;
	}
}