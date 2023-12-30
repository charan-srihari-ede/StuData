<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%!
	Statement st;
	ResultSet rs;
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Next Page</title>
    <style>
        td{padding: 5px 5px 5px 5px; margin: 1px;}
            th{padding: 5px 5px 5px 5px; margin: 1px;}
            tr{padding: 5px 5px 5px 5px; margin: 1px;}

        table{
            border-collapse: collapse;
        }
    </style>
    <script src="./filter.js"></script>
</head>
<body style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
    <%
    String checkboxValues =(String) session.getAttribute("checkboxValues");
        // Retrieve the query parameter "checkboxValues"
        //String checkboxValues = request.getParameter("checkboxValues");
        String[] ValueArray = checkboxValues.split(" ");
    try
    {	
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","");
        st=con.createStatement();
        try{
            rs = st.executeQuery("SELECT * FROM facultydetails");
            
            %> <div id="content">
                <table border="1" id="emp-table">
                    <thead>
                    <%int i=1;
                    for(String value: ValueArray){
                        %>
                        <th col-index=<%=i%>><% out.println(value); if(value.equals("teaching")||value.equals("address")){%><select onchange="filter_rows()" class="table-filter" style="width: 20%;">
                            <option value="all">--select--</option>
                        </select></th>
                        <%
                    }
                    i++;
                    }
                    %>
                    </thead><tbody>
            <%

            while(rs.next()){
                //out.println(rs.getString("empcode"));
               %><tr><%
                for(String value: ValueArray){
                    //out.println(value);
                    
                    %>
                    <td><% out.println(rs.getString(value)); %></td>
                    
                    <%
                }
                %></tr> <%
                
            }

            %></tbody></table></div><center><button style="margin-top: 10px;" onclick="printContent()">print</button></center><script>
                function printContent() {
                    var content = document.getElementById('content');
                    var pri = window.open('', '_blank', 'height=500,width=700');
        pri.document.write('<html><head><title>Print</title></head><body>');
                    pri.document.write(content.innerHTML);
                    pri.document.write('</body></html>');
                    pri.document.close();
                    pri.print();
                }
            </script>
            <script>
                window.onload = () => {
                    // console.log(document.querySelector("#emp-table > tbody > tr:nth-child(1) > td:nth-child(2) ").innerHTML);
                };
        
                getUniqueValuesFromColumn()
                
            </script>
            
            <%

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
</body>
</html>
