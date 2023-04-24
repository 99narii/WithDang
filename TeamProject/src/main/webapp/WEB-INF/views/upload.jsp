<%--
  Created by IntelliJ IDEA.
  User: ezen
  Date: 2023-04-24
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<script src="http://malsup.github.com/jquery.form.js"/>

</head>
<body>
<input id="excelFile" type="file" name="excelFile"/>
<button type="button" id="addExcelImportBtn" class="btn" onclick="check()"></button>
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
