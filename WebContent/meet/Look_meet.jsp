<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path=request.getContextPath(); %>
<html>
	<head>	
		<title>�鿴�����¼</title>
	</head>
	<body bgcolor="#075B97">
	<center>
		<table width="965" border="0" cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><jsp:include page="/top.jsp"/></td></tr>
				<tr bgcolor="#EDEEFF">
					<td width="13" background="<%=path%>/image/left.jpg"></td>
					<td align="center" valign="top" bgcolor="#EDEEFF"><jsp:include page="/side.jsp"/></td>
					<td width="725" align="center" valign="top"  bgcolor="#E8F1F6">
        				<br><br>
      					<table width="90%"  border="0">
        					<tr valign="bottom">
          						<td width="31%" height="25" align="left" style="border:0"><font color="red"></font></td>
          						<td width="47%" align="right">${logonuser.userable}
          						    <c:if test="${logonuser.userable==1}">            	      				
        	              			<a href="/MeetServlet?type=link">[��ӻ����¼]</a>            
    	              				</c:if>
	          					</td>
          						<td width="21%" align="right"><strong>������Ϣ����&nbsp;&nbsp;</strong></td>
        					</tr>
        				</table>
			      		<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
        					<tr><td height="30" colspan="4">���������Ϣ</td></tr>
       						<tr align="center" bgcolor="#B9D9E9">
          						<td width="31%" height="25">��������</td>
						        <td width="20%" height="25">������</td>
						        <td width="32%" height="25">����ʱ��</td>
						        <td width="8%" height="25">����</td>
					        </tr>
					        <c:forEach var="meet" items="${meetlist }">					
         					
           					<tr height="40">
             					<td align="center"><a href="/meet/meet_sigle_look.do?id=${meet.meetid}">${meet.subject}</a></td>
             					<td align="center">${meet.speaker}</td>
             					<td align="center">${meet.time}</td>
             					<td align="center">
              						<c:if test="${logonuser.userable==1}"> 
		               				<a href="<%=request.getContextPath()%>/meet/meet_del.do?id=${meet.meetid}&page=<%=session.getAttribute("currentpage")%>" onclick="javascript:return(confirm('ȷ��Ҫɾ���ü�¼��?'))">[ɾ��]</a>
        	      					</c:if>
            	  					 <c:if test="${logonuser.userable==0}"> ��Ȩ��</c:if>
				           </tr>
				          
				          </c:forEach>
				          <c:if test="${empty meetlist }">
				          
				           <tr><td colspan="4" align="center"><li><b>û�м�¼��ʾ!</b></li></td></tr>
				          </c:if>
				       </table>
				       <jsp:include page="/page.jsp"/>
				   </td>
				   <td width="13" background="<%=path%>/image/right.jpg"></td>
			</tr>
			<tr><td colspan="4"><jsp:include page="/end.jsp"/></td></tr>
		</table>
		</center>
	</body>
</html>