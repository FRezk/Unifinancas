<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>File Upload</title>
	</head>
	<body>
		<form method="post" action="UploadServlet" enctype="multipart/form-data">
		Select file to upload:
		<input type="file" name="dataFile" id="fileChooser"/>
		<br/><br/>
		<input type="submit" value="Upload" />
		</form>
	</body>
</html>