<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  
  <title>Document</title>
   <link rel="stylesheet"  href="css/bootstrap.min.css">
</head>
<style type="text/css">
  .cuc{
    color: red;
    display:block!important;
  }
  .phan{
    display: none;
  }
.cucde{
  display: none;
}
</style>
<body>
  <div class="row">
          <div class="a">
            <p class="cucheo">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
            <p class="cucbo">xemthem</p>
            <p class="cucde">bbbbbbbbbbbbbbbbbbbbbbb</p>
          </div>
          <div class="a">
            <p class="cucheo">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
            <p class="cucbo">xemthem</p>
            <p class="cucde">bbbbbbbbbbbbbbbbbbbbbbb</p>
          </div>
          <div class="a">
            <p class="cucheo">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
            <p class="cucbo">xemthem</p>
            <p class="cucde">bbbbbbbbbbbbbbbbbbbbbbb</p>
          </div>
          <div class="a">
            <p class="cucheo">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
            <p class="cucbo">xemthem</p>
            <p class="cucde">bbbbbbbbbbbbbbbbbbbbbbb</p>
          </div>
          <div class="a">
            <p class="cucheo">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
            <p class="cucbo">xemthem</p>
            <p class="cucde">bbbbbbbbbbbbbbbbbbbbbbb</p>
          </div>
  </div>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript">
       $(document).ready(function(){
          $('.cucbo').click(function(){
            $(this).next().addClass('cuc');
            $(this).addClass('phan');
             $(this).prev().addClass('phan');
          })
       });
  </script>
</body>
</html>