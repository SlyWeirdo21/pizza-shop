<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<h3>통합매출현황조회</h3>
<table border="1">
	<tr>
		<td>매출전표번호</td>
		<td>지점</td>
		<td>판매일자</td>
		<td>피자코드</td>
		<td>피자명</td>
		<td>판매수량</td>
		<td>매출액</td>
	</tr>
	<%
		try
	    {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection(
	        "jdbc:oracle:thin:@localhost:1521:xe","system","1234");
	        Statement stmt=con.createStatement();
	
	        String query = "SELECT " +
	        	    "TBL_SALELIST_01.SALENO, " +
	        	    "TBL_SHOP_01.SCODE, " +
	        	    "TBL_SHOP_01.SNAME, " +
	        	    "TBL_SALELIST_01.SALEDATE, " +
	        	    "TBL_PIZZA_01.PCODE, " +
	        	    "TBL_PIZZA_01.PNAME, " +
	        	    "TBL_SALELIST_01.AMOUNT, " +
	        	    "TBL_SALELIST_01.AMOUNT * TBL_PIZZA_01.COST as MONEY " +
	        	"FROM " +
	        	    "TBL_PIZZA_01, TBL_SHOP_01, TBL_SALELIST_01 " +
	        	"WHERE " +
	        	    "TBL_PIZZA_01.PCODE = TBL_SALELIST_01.PCODE AND " +
	        	    "TBL_SHOP_01.SCODE = TBL_SALELIST_01.SCODE " +
	    		"ORDER BY " +
	        		"TBL_SALELIST_01.SALENO ASC " ;	
	        	
				System.out.println(query);
	        ResultSet rs=stmt.executeQuery(query);
	        while(rs.next()) {
	            %>
	            	<tr>
	            		<td><%=rs.getInt("SALENO") %></td>
	            		
	            		<td><%=rs.getString("SCODE") %>
	            			<%=rs.getString("SNAME") %></td>
	            			
	            		<td><%=rs.getString("SALEDATE") %></td>
	            		<td><%=rs.getString("PCODE") %></td>
	            		<td><%=rs.getString("PNAME") %></td>
	            		<td><%=rs.getInt("AMOUNT") %></td>
	            		<td><%=rs.getString("MONEY") %></td>
	            	</tr>
	            <%
	        }
	        con.close();
	    }
	    catch(Exception e)
	    { 
	        System.out.println(e);
	    }	
	%>
</table>