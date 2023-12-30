<%@ page language="java" import="java.sql.*" %>
<%!
	Statement st;
	ResultSet rs;
%>
<%
try
{	
	Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","");
	st=con.createStatement();
	String username,password;
	

	username=(String)request.getParameter("username");
	password=(String)request.getParameter("password");
	
	try
	{
		rs=st.executeQuery("select * from login where username='"+username+"';");
		if(rs.next())
		{
			if( ( username.equals(rs.getString(1)) && password.equals(rs.getString(2)) ) )
			{
				response.sendRedirect("dtable.jsp");
		
			}
		}
		
		
		
		rs.close();
		st.close();
		con.close();
		//response.sendRedirect(target);
	}
	catch(Exception e)
	{
		out.print(e);
	}


}
catch(Exception e)
{
	out.print(e);
}
%>
	