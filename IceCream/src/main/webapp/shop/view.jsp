<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-19
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63&libraries=services"></script>
<body>
<div class="contentContainer" style="width: 100%; min-width: 500px">
    <div class="buttonContainer" style="width: 100%; text-align: right">
        <button type="button" class="ui-button" onclick="history.back()">목록으로</button>
    </div>
    <div class="content">
        <label>${dto.name}</label>
        <hr>
        <label>도로명 : ${dto.addr2}</label><br>
        <label>지번 : ${dto.addr3}</label><br>
        <label>상세주소 : ${dto.addr4}</label><br>
        <label>Tel : ${dto.tel}</label>
    </div>
    <div id="map" style="width: 500px; height: 400px; margin: auto"></div>

    <script type="text/javascript">
        let mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        let map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        let geocoder = new kakao.maps.services.Geocoder();
        // 주소 할당
        <c:if test="${dto.addr2 == null}">
        let address = '${dto.addr3}';
        </c:if>
        <c:if test="${dto.addr2 != null}">
        let address = '${dto.addr2}';
        </c:if>
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(address, function(result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                let marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                let infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.name}</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    </script>
</div>
</body>
</html>