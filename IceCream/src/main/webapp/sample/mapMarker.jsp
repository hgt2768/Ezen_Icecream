<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-12
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>마커에 인포윈도우 표시하기</title>
    <link rel="stylesheet" href="../css/sample.css">
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63"></script>
<script>
    let mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.4006939,126.9762521), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    let map = new kakao.maps.Map(mapContainer, mapOption);

    // 마커가 표시될 위치입니다
    let markerPosition  = new kakao.maps.LatLng(37.4006939,126.9762521);

    // 마커를 생성합니다
    let marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    let iwContent = '<div style="padding:5px;">베스킨라빈스 인덕원역 점 <br><a href="https://map.kakao.com/link/map/베스킨라빈스 인덕원역점,37.4006939,126.9762521" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(37.4006939,126.9762521); //인포윈도우 표시 위치입니다

    // 인포윈도우를 생성합니다
    let infowindow = new kakao.maps.InfoWindow({
        position : iwPosition,
        content : iwContent
    });

    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);
</script>
</body>
</html>
