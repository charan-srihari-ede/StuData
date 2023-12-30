<!DOCTYPE html>
<html>
    <head>
        <title>Transfer Rows Between Two HTML Table</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <style>
            
            .container{overflow: hidden}
            .tab{float: left}
            .tab-btn{margin: 50px;}
            button{display:block;margin-bottom: 20px;}
            tr{transition:all .25s ease-in-out}
            tr:hover{background-color: #ddd;}
            

            td{padding: 5px 5px 5px 5px; margin: 1px;}
            th{padding: 5px 5px 5px 5px; margin: 1px;}
            tr{padding: 5px 5px 5px 5px; margin: 1px;}

        </style>    
    </head>
    <body style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); border: 2px solid black; padding: 10px;">
        
        <div class="container">
            
            <div class="tab">
                <table id="table1" border="1" style="font-size: large; border-collapse: collapse;" >
                    <tr>
                        <th>Column Name</th>
                      
                        <th>Select</th>
                    </tr>
                    <tr>
                        <td>name</td>
                  
                        <td><input type="checkbox" name="check-tab1" value="name"></td>
                    </tr>
                     <tr>
                        <td>empcode</td>
                        
                        <td><input type="checkbox" name="check-tab1" value="empcode"></td>
                    </tr>
                    <tr>
                        <td>departmentid</td>
                      
                        <td><input type="checkbox" name="check-tab1" value="departmentid"></td>
                    </tr>
                     <tr>
                        <td>status</td>
                      
                        <td><input type="checkbox" name="check-tab1" value="status"></td>
                    </tr>
                     <tr>
                        <td>teaching</td>
                       
                        <td><input type="checkbox" name="check-tab1" value="teaching"></td>
                    </tr>
                     
                    <tr>
                        <td>mobile</td>
                  
                        <td><input type="checkbox" name="check-tab1" value="mobile"></td>
                    </tr>
                     <tr>
                        <td>address</td>
                        
                        <td><input type="checkbox" name="check-tab1" value="address"></td>
                    </tr>
                    <tr>
                        <td>mailid</td>
                      
                        <td><input type="checkbox" name="check-tab1" value="mailid"></td>
                    </tr>
                     <tr>
                        <td>age</td>
                      
                        <td><input type="checkbox" name="check-tab1" value="age"></td>
                    </tr>
                     <tr>
                        <td>experience</td>
                       
                        <td><input type="checkbox" name="check-tab1" value="experience"></td>
                    </tr>


                </table>
            </div>
            
            <div class="tab tab-btn">
                <button onclick="tab1_To_tab2();">>>>>></button>
                <button onclick="tab2_To_tab1();"><<<<<</button>
                <form>
                    <input type="submit" onclick="next()" name="submit">
                <input type="hidden" id="checkboxValuesInput" name="checkboxValues" value="">
</form>
            </div>
            
            <div class="tab">
                <table id="table2" border="1" style="font-size: large;border-collapse: collapse;">
                    <tr>
                        <th>Column Name</th>
                       
                        <th>Select</th>
                    </tr>
                </table>   
            </div>
        </div>
        
        <script>
            
            function tab1_To_tab2()
            {
                var table1 = document.getElementById("table1"),
                    table2 = document.getElementById("table2"),
                    checkboxes = document.getElementsByName("check-tab1");
           // console.log("Val1 = " + checkboxes.length);
                 for(var i = 0; i < checkboxes.length; i++)
                     if(checkboxes[i].checked)
                        {
                            // create new row and cells
                            var newRow = table2.insertRow(table2.length),
                                cell1 = newRow.insertCell(0),
                                cell4 = newRow.insertCell(1);
                            // add values to the cells
                            cell1.innerHTML = table1.rows[i+1].cells[0].innerHTML;
                            cell4.innerHTML = "<input type='checkbox' name='check-tab2' value="+ table1.rows[i+1].cells[0].innerText+">";
                            // remove the transfered rows from the first table [table1]
                            console.log(table1.rows[i+1].cells[0].innerText);
                            var index = table1.rows[i+1].rowIndex;
                           table1.deleteRow(index);
                            // we have deleted some rows so the checkboxes.length have changed
                            // so we have to decrement the value of i
                            i--;
                           //console.log(checkboxes.length);
                        }
            }
            
            
            function tab2_To_tab1()
            {
                var table1 = document.getElementById("table1"),
                    table2 = document.getElementById("table2"),
                    checkboxes = document.getElementsByName("check-tab2");
            console.log("Val1 = " + checkboxes.length);
                 for(var i = 0; i < checkboxes.length; i++)
                     if(checkboxes[i].checked)
                        {
                            // create new row and cells
                            var newRow = table1.insertRow(table1.length),
                                cell1 = newRow.insertCell(0),
                                cell4 = newRow.insertCell(1);
                            // add values to the cells
                            cell1.innerHTML = table2.rows[i+1].cells[0].innerHTML;
                            cell4.innerHTML = "<input type='checkbox' name='check-tab1' value="+table2.rows[i+1].cells[0].innerText+">";
                        
                            // remove the transfered rows from the second table [table2]
                            var index = table2.rows[i+1].rowIndex;
                            table2.deleteRow(index);
                            // we have deleted some rows so the checkboxes.length have changed
                            // so we have to decrement the value of i
                            i--;
                        }
            }
function next() {
    // JavaScript code for handling checkboxes
    var table2 = document.getElementById("table2");
    var checkboxes = document.getElementsByName("check-tab2");
    var values = [];

    for (var checkbox of checkboxes) {
            values+=checkbox.value+" ";
    }
    console.log();
    // Convert the JavaScript array to a JSON string
   // var checkboxValuesJSON = JSON.stringify(values);

    // Set the JSON string as the value of a hidden input field
    document.getElementById("checkboxValuesInput").value = values;

    // Redirect to home.jsp
}
</script>

<%-- JSP code for setting session attribute --%>
<%
    String checkboxValues = request.getParameter("checkboxValues");
    if (checkboxValues != null &&  request.getParameter("submit")!=null) {
        session.setAttribute("checkboxValues", checkboxValues);
        response.sendRedirect("home.jsp");
    }
%>



        
    </body>
</html>