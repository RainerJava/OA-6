<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<% String path=request.getContextPath(); %>
<html>
	<head>
		<html:base/>
		<title>�������</title>
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
          						<td width="31%" height="25" align="left" style="border:0"><font color="red"><html:errors/></font></td>
          						<td width="47%" align="right">
          						<c:if test="${logonuser.userable==1 }">               					
                 			 		<a href="NoticeServlet?type=link">[����¹���]</a>
                					</c:if>         
          						</td>
          						<td width="21%" align="right"><strong>������Ϣ����&nbsp;&nbsp;</strong></td>
        					</tr>
				      	</table>
				      	<table width="90%" border="5" cellspacing="0" cellpadding="5" bordercolor="#F0F0F0" bordercolorlight="#1687AF" bordercolordark="#E8F1F6" rules="none" bgcolor="white">
				      		<tr><td height="30" colspan="5">�������</td></tr>
        					<tr height="25" align="center" bgcolor="#B9D9E9">
          						<td width="31%">��������</td>
	          					<td width="21%">������</td>
    	      					<td width="28%">����ʱ��</td>
        	  					<td colspan="2">����</td>
        					</tr>
        					<c:forEach  var="pcard" items="${pcardlist }">
        					
					        <tr height="40" align="center">
            					<td><a href="/NoticeServlet?id=${pcard.pcardid }">${pcard.subject}</a></td>
            					<td>${pcard.author}</td>
            					<td>${pcard.time} </td>
            					<c:if test="${logonuser.userable==0}">
              					<td colspan="2">��Ȩ��</td>
            					</c:if>
            					<c:if test="${logonuser.userable==1}">
            					<td width="10%">
               						<a href="<%=request.getContextPath()%>/NoticeServlet?id=${pcard.pcardid }&updatetype=link">���޸�</a>
            					</td>
            					<td width="10%">
               						<a href="<%=request.getContextPath()%>/NoticeServlet?id=${pcard.pcardid }&page=<%=session.getAttribute("currentpage")%>" onclick="return(confirm('ȷ��Ҫɾ���ü�¼��?'))">��ɾ��</a>
            					</td>
            					</c:if>
          					</tr>
         					</c:forEach>
         					<c:if test="${empty pcardlist }">
        					
          					<tr><td colspan=5 align=center><li><b>û�м�¼��ʾ!</b></li></td></tr>
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