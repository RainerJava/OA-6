<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<html:base />
<title>������ļ���</title>
</head>
<body bgcolor="#075B97">
	<center>
		<table width="965" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="4"><jsp:include page="/top.jsp" /></td>
			</tr>
			<tr bgcolor="#EDEEFF">
				<td width="13" background="<%=path%>/image/left.jpg"></td>
				<td align="center" valign="top" bgcolor="#EDEEFF"><jsp:include
						page="/side.jsp" /></td>
				<td width="720" align="center" valign="top" bgcolor="#E8F1F6">
					<br> <br>
					<table width="90%" border="0">
						<tr valign="bottom">
							<td width="30%" height="25" align="left" style="border: 0"><font
								color="red"><html:errors /></font></td>
							<td width="40%" align="right"><c:if
									test="${logonuser.userable==1 }">
									<a
										href="<%=request.getContextPath()%>/text/text_add.do?addtype=link">[�½�����]</a>
								</c:if></td>
							<td width="20%" align="center">��/���Ĺ���&nbsp;</td>
						</tr>
					</table>
					<table width="90%" border="5" cellspacing="0" cellpadding="5"
						bordercolor="#F0F0F0" bordercolorlight="#1687AF"
						bordercolordark="#E8F1F6" rules="none" bgcolor="white">
						<tr>
							<td height="30" colspan="5">���ļ���</td>
						</tr>
						<tr align="center" bgcolor="#B9D9E9">
							<td width="8%">״̬</td>
							<td width="24%">��������</td>
							<td width="25%">������</td>
							<td width="25%">����ʱ��</td>
							<td width="8%">����</td>
						</tr>
						<c:forEach var="doc" items="${gettextlist}">


							<tr height="40">
								<td align="center"><c:if test="${doc.mark==1 }">

										<b>δ��</b>
									</c:if> <c:if test="${doc.mark==0 }">�Ѷ�</c:if></td>
								<td align="center"><c:if test="${doc.mark==1 }">
										<b>
									</c:if><a
									href="<%=request.getContextPath()%>/TextAddServlet?id=${doc.textid }&addtype=get">${doc.subject}
										</a></td>
								<td align="center"><c:if test="${doc.mark==1 }">
										<b>
									</c:if> ${doc.sender }</td>
								<td align="center"><c:if test="${doc.mark==1 }">
										<b>
									</c:if>${doc.sendtime }</td>
								<td align="center"><c:if test="${logonuser.userable==1 }">
										<a
											href="<%=request.getContextPath()%>/text/text_del.do?id=<bean:write name='textsigle' property='textid'/>&from=get&page=<%=session.getAttribute("currentpage")%>"
											onclick="javascript:return(confirm('ȷ��Ҫɾ���ü�¼��?'))">[ɾ��]</a>
									</c:if> <c:if test="${logonuser.userable==0 }">��Ȩ��</c:if></td>
							</tr>

						</c:forEach>
						<c:if test="${empty  gettextlist}">
						
							<tr>
								<td colspan="5" align="center"><li><b>û�м�¼��ʾ��</b></li></td>
							</tr>
						</c:if>
					</table> <jsp:include page="/page.jsp" />
				</td>
				<td width="13" background="<%=path%>/image/right.jpg"></td>
			</tr>
			<tr>
				<td colspan="4"><jsp:include page="/end.jsp" /></td>
			</tr>
		</table>
	</center>
</body>
</html>
