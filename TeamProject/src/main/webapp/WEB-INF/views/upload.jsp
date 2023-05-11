<%--
  Created by IntelliJ IDEA.
  User: ezen
  Date: 2023-04-24
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://malsup.github.io/jquery.form.js"></script>


    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Document</title>
</head>
<body>
.<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/excel/excelUploadAjax.do">
    <input id="excelFile" type="file" name="excelFile"/>
<%--    <button type="button" id="addExcelImportBtn" class="btn" onclick="check()">업로드</button>--%>
    <input type="submit" value="send">
</form>
<script>
    function checkFileType(filePath) {
        var fileFormat = filePath.split(".");
        if (fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
            return true;
        } else {
            return false;
        }
    }



    function check() {
        var file = $("#excelFile").val();
        if (confirm("업로드?")) {
            var options = {
                success: function (data) {
                    console.log(data);
                    alert("업로드");
                },
                type: "POST"
            };
            $("#excelUploadForm").ajaxSubmit(options);
        }
    }

</script>

</body>
</html>
