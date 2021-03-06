<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    #container{
        text-align: center;
        border: 1px solid black;
    }
    table{
        margin: 0 auto;
        border: 1px solid black;
        
    }

</style>
<body>
    <jsp:include page="../template/header2.jsp" flush="false"></jsp:include>
        <div id="container">
            <h2 id="headline">캠핑장 신청/현황 관리</h2>
                <hr>
            <table>
                <tr>
                    <th>신청번호</th>
                    <th>신청자</th>
                    <th>캠핑장 이름</th>
                    <th>캠핑장 주소</th>
                    <th>캠핑장 전화번호</th>
                    <th>진행상황</th>
                </tr>
            <c:forEach var="spot" items="${requestScope.list }">
                <tr>
                        <td><p>${spot.sno }</p></td>
                        <td><p>${spot.id }</p></td>
                        <td><p>${spot.sname}</p></td>
                        <td><p>${spot.address }</p></td>
                        <td><p>${spot.tel1 }-${spot.tel2 }-${spot.tel3 }</p></td>
                        <td><p>${spot.status }</p></td>
                        <td><a href="spotDeleteAction.do?sno="${spot.sno}>삭제</a></td>
                </tr>
            </c:forEach>
                <tr>
                    <td colspan="7">
                        <div class="page_bar">
                            <c:if test="${pagging.previousPageGroup }">
                                <a href="applySpotList.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
                            </c:if>
                            <c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
                            end="${pagging.endPageOfPageGroup}">
                                <a href="applySpotList.do?pageNo=${i }">${ i}</a>
                            </c:forEach>
                        
                            <c:if test="${pagging.nextPageGroup }">
                                <a href="applySpotList.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </table>
        </div>    
    <jsp:include page="../template/footer.jsp" flush="false"></jsp:include>
</body>
</html>