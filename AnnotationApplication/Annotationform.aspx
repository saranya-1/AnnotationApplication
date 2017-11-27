<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Annotationform.aspx.cs" Inherits="AnnotationApplication.Annotationform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 285px;
        }
        .auto-style2 {
            width: 386px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div id="base">
            <strong>
            <asp:Label ID="Label1" runat="server" Text="Video Annotation Tool"></asp:Label>
            </strong>
        <table class="auto-style9">
            <tr>
                <td>
                    <div id="video_container">
                        <video width="480" height="360" controls="controls" id="video">
                            <source src="Videos/vid_002.mp4" type="video/mp4"/>
                         
                            </video>
                           <audio id="myaudio" >
                            <source src="Audio/Joannas Wedding Toast (online-audio-converter.com).mp3" type="audio/mpeg"/>
                            </audio>
                    <div id="status" ></div>
                        <asp:HiddenField ID="curTimeHiddenField" runat="server" OnValueChanged="curTimeHiddenField_ValueChanged" />
                        <br />
                    </div>   
                </td>
                <td class="auto-style2" valign="top"  style="border: 1px solid black">

                    <strong>

                    <asp:Label ID="Label16" runat="server" Text="Pair Relationship"></asp:Label>

                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="STEP 1: Please select the first Person/Group:"></asp:Label>
                    <br />
                    <br />
                    <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
                        <asp:DropDownList ID="dropDownBox1" runat="server" OnSelectedIndexChanged="dropDownBox1_SelectedIndexChanged" AutoPostBack="True">
                         <asp:ListItem>Please select</asp:ListItem>
                         <asp:ListItem>Create group</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="STEP 2: Please select the second  Person/Group"></asp:Label>
                    <br />
                    <br />
                        <asp:DropDownList ID="dropDownBox2" runat="server" OnSelectedIndexChanged="dropDownBox2_SelectedIndexChanged" AutoPostBack="True">
                         <asp:ListItem>Please select</asp:ListItem>
                          <asp:ListItem>Create group</asp:ListItem>
                        </asp:DropDownList>
                    <%--<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>--%>
                    <br />
                    </strong>                  
                    <%--<asp:DropDownList ID="dropDownBox2" runat="server" OnSelectedIndexChanged="dropDownBox2_SelectedIndexChanged">
                         <asp:ListItem>Please select</asp:ListItem>
                    </asp:DropDownList>--%>
                    <asp:HiddenField ID="HiddenField1" runat="server" OnValueChanged="HiddenField1_ValueChanged" />
                    <br />
                    <br />
                   </td>
            <td class="auto-style1" valign="top" style="border: 1px solid black">
                
                   <asp:Panel ID="createGroupPanel" runat="server" visible="false" Width="308px">
                       <asp:Label ID="Label13" runat="server" Text="To create a group:" style="font-weight: 700"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" Text="STEP 1: Enter Group Name:" style="font-weight: 700"></asp:Label>
                <br />
                
                <br />
                <asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="STEP 2: Select persons:" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
                       
                     </asp:ListBox> 
                    <br />
                    <asp:HiddenField ID="grpMemHiddenField" runat="server" />
                       <asp:Panel ID="addgroupPanel" runat="server">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:Button ID="Button1" runat="server" OnClick="btnAddGroup_Click" Text="Add Group" />
                           &nbsp;&nbsp;&nbsp;&nbsp;
                       </asp:Panel>
                    <br />
                       <asp:Panel ID="groupButtonPanel" runat="server" Visible="False">
                           <asp:Button ID="Button2" runat="server" OnClick="btnRemoveGroup_Click" Text="Remove Group" />
                           &nbsp;
                           <asp:Button ID="Button6" runat="server" Text="Edit Group" />
                       </asp:Panel>
                    <br />
                <br />
                   </asp:Panel>
                
            </td>

               
            </tr>
             </table>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
       
            <br />
            <strong>
            <asp:Label ID="Label17" runat="server" Text="STEP 3: Select Relationships"></asp:Label>
            </strong>
            <br />
       
        <table class="auto-style6" id="relationshipTable" runat="server" style="width:20%">
            <tr>
           <td >
               <asp:Label ID="Label7" runat="server" Font-Bold="true" ForeColor="DodgerBlue" Text="Family">
                    </asp:Label>
               <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" 
                   RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0 
                   BorderColor="SeaGreen" BorderWidth="2">
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Mother-Child</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Father-Child</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>GrandMother-GrandChild</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>GrandFather-GrandChild</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Auntie-Child</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Uncle-Child</asp:ListItem>
                   <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
               
&nbsp; 
            </td>
            <td valign="top"><!--</div>!-->
                <asp:Label ID="Label6" runat="server" Font-Bold="true" ForeColor="DodgerBlue" Text="Hierarchical">
                    </asp:Label>
             <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal" 
        RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0
                 BorderColor="SeaGreen" BorderWidth="2">
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Traineer-Trainee</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Teacher-Student</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Boss-Subordinate</asp:ListItem>
                   <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
               
&nbsp; 
            </td>
             <td></td>
            <td></td>
           
            </tr>
            </table>
             <table class="auto-style6"  id="relationshipTable1" runat="server" style="width:20%">
            <tr>
           <td >
              <asp:Label ID="Label5" runat="server" Font-Bold="true" ForeColor="DodgerBlue" Text="Reciprocity">
                    </asp:Label>
         <asp:CheckBoxList ID="CheckBoxList3" runat="server" RepeatDirection="Horizontal" 
        RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0 BorderColor="SeaGreen" BorderWidth="2">
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Friends</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Classmates</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Siblings</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Neighbours</asp:ListItem>
                   <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
               
&nbsp; 
               </td>
                <td valign="top">
                    <asp:Label  ID="Label4" runat="server" Font-Bold="true" ForeColor="DodgerBlue" Text="Partner">
                    </asp:Label>
               <asp:CheckBoxList ID="CheckBoxList4" runat="server" RepeatDirection="Horizontal" 
        RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0 BorderColor="SeaGreen" BorderWidth="2">
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Spouse</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Lovers</asp:ListItem>
                   <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
                </td>
                </tr></table>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" Width="120px" OnClick="btnAdd_Click" />
         <br />
        <br />     
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
              <Columns>
                  <asp:TemplateField>
                        <itemtemplate>
                            <asp:checkbox ID="cbSelect" runat="server"></asp:checkbox>
                         </itemtemplate> 
                  </asp:TemplateField>
                <asp:BoundField DataField="person1" HeaderText="Person1" SortExpression="" />
                <asp:BoundField DataField="person2" HeaderText="Person2"  SortExpression="" />
                <asp:BoundField DataField="relationship" HeaderText="Relationship" SortExpression="" />
            </Columns>
        </asp:GridView>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;&nbsp; <asp:Button ID="Button5" runat="server" Text="Remove" OnClick="Button5_Click" />
     <script>
            var vLength;
          //  button helper functions 
          //  skip forward, backward, or restart
          function setTime(tValue) {
            //  if no video is loaded, this throws an exception 
            try {
              if (tValue == 0) {
                video.currentTime = tValue;
              }
              else {
                video.currentTime += tValue;
              }

            } catch (err) {
              // errMessage(err) // show exception
              errMessage("Video content might not be loaded");
            }
          }

          //  display video duration when available
          //video.addEventListener("loadedmetadata", function () {
          //    vLength = video.duration.toFixed(1);
          //    document.getElementById("vLen").textContent = vLength; // global variable
          //}, false);

          ////  display the current and remaining times
          //video.addEventListener("timeupdate", function () {
          //  //  Current time  
          //  var vTime = video.currentTime;
          //  document.getElementById("curTime").textContent = vTime.toFixed(1);
          //  document.getElementById("vRemaining").textContent = (vLength - vTime).toFixed(1);
          //}, false);
          
            var video1 = document.getElementById("video");
            video1.onpause = function () {
                var time = video1.currentTime;
                document.getElementById("curTimeHiddenField").value = time;
                __doPostBack(document.getElementById('curTimeHiddenField').name, '')
            };


            video1.onplay=function(){
                var aud = document.getElementById('myaudio');
                aud.play;
            };

            function startvideofrom() {
                var video = document.getElementById("video");
                var aud = document.getElementById('myaudio');
                var textbox = document.getElementById("curTimeHiddenField");
                video.currentTime = textbox.value;
                video.pause;
                myaudio.pause;
                
            }
  
       </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script type="text/javascript" ></script>
           <script>
               
               
               var tar;
               $("#dropDownBox1").on("click", function (e) {
                   tar = e.target.id;
               //    alert("Target control is :" + tar);
               })

               $("#dropDownBox2").on("click", function (e) {
                   tar = e.target.id;
                 //  alert("Target control is :" + tar);
               })


               $(document).ready(function () {
                   $('video').click(function (e) {
                       if (e.ctrlKey) {
                           var offset = $(this).offset();
                           var x = e.pageX - offset.left;
                           var y = e.pageY - offset.top;
                           var cuurTime = document.getElementById("curTimeHiddenField").value;
                           var result = PageMethods.getPersonDetails(x, y,cuurTime, onSuccess, onFailure);

                           function onSuccess(result) {
                               alert(result+" added to group");
                               var listbox = document.getElementById("ListBox1");
                                var newOption = window.document.createElement('OPTION');
                                newOption.text = result;
                                newOption.value = result;
                                listbox.options.add(newOption);
                                var hidvalue = document.getElementById("grpMemHiddenField").value;
                                hidvalue = hidvalue + "," + result;
                                document.getElementById("grpMemHiddenField").value = hidvalue;
                           }

                           function onFailure(result) {
                               alert("please click within the box");
                           }


                       }
                       else {
                           var offset = $(this).offset();
                           var x = e.pageX - offset.left;
                           var y = e.pageY - offset.top;
                           document.getElementById("HiddenField1").value = x + "," + y + "," + tar;
                           __doPostBack(document.getElementById('HiddenField1').name, '')
                       }
                     
                   });
               });

           </script>  
            </div>   
    </form>

    
</body>
</html>
