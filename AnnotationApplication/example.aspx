<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example.aspx.cs" Inherits="AnnotationApplication.example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="video_container">
                        <video width="480" height="360" controls="controls" id="video">
                            <source src="Videos/vid_002.mp4" type="video/mp4"/>
                        </video>
         </div>
       

    </div>
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script type="text/javascript" src="./javascript.js"></script>
           <script>

               var loader = 1;
               var loaderArray = [];

               document.addEventListener('mousedown', MultiSelect);
               document.addEventListener('click', singleSelect);


               </script>

    </form>
</body>
</html>
