<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Marverlous Java Base</title>

        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!--Custom css-->
        <link rel="stylesheet" href="./css/PublicLayout.css"/>
        <link rel="stylesheet" href="./css/Home.css"/>
    </head>
    <body>
        <!--Header-->
        <jsp:include page="component/PublicLayoutHeader.jsp" />

        <div id="body-container">
        <!--aside-->
        <jsp:include page="component/AsidePublicLayout.jsp"/>

            <!--main content-->
            <jsp:include page="${VIEW}" />
        </div>

        <!--footer-->
        <jsp:include page="component/FooterPublicLayout.jsp"/>



        <!--Bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        
        <!--custom js-->
        <script src="./js/Home.js"></script>
    </body>
</html>
