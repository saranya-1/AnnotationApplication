<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Annotationform.aspx.cs" Inherits="AnnotationApplication.Annotationform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            width: 67%;
            height: 29px;
        }
        .auto-style5 {
            height: 137px;
            width: 430px;
        }
        .auto-style11 {
            width: 323px;
            height: 137px;
        }
       
        .auto-style12 {
            margin-left: 0px;
        }
       
        .auto-style13 {
            width: 100%;
            height: 137px;
            margin-left: 234px;
            margin-right: 234px
           
       
        }
        .auto-style14 {
            width: 20%;
            height: 137px;
        }
        .auto-style15 {
            width: 40%;
            height: 137px;
        }
        .auto-style16 {
            height: 137px;
        }
       
    </style>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" >
        <div id="base">
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
            <asp:Label ID="Label1" runat="server" Text="Video Annotation Tool" Font-Bold="true" Font-Size="X-Large" ForeColor="Brown"></asp:Label>
                </div>
            
        <br />
            <br />
                    <div id="video_container">
                        <video style="display:block; margin: 0 auto;" controls="controls" id="video" poster="transparent.png">
                            <source src="Videos/vid_002.mp4" type="video/mp4"/>
                         
                            </video>
                           <audio id="myaudio" >
                            <source src="Audio/Joannas Wedding Toast (online-audio-converter.com).mp3" type="audio/mpeg"/>
                            </audio>
                    <div id="status" ></div>
                        <asp:HiddenField ID="curTimeHiddenField" runat="server" OnValueChanged="curTimeHiddenField_ValueChanged" />
                        <br />
                    </div>   
            
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
      
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
            <br />
            <br />
       
        <table  id="relationshipTable" runat="server" align="center" class="auto-style13">
            <tr >
                <td valign="top" class="auto-style14" style="border: 1px solid black" >
                    <strong>

                    <asp:Label ID="Label16" runat="server" Text="Pair Relationship" ForeColor="Brown"></asp:Label>

                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="STEP 1: Please select the first Person/Group:" ForeColor="DodgerBlue" ></asp:Label>
                    <br />
                    <br />
                    <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
                        <asp:DropDownList ID="dropDownBox1" runat="server" OnSelectedIndexChanged="dropDownBox1_SelectedIndexChanged" AutoPostBack="True" Height="29px" Width="177px">
                         <asp:ListItem>Please select</asp:ListItem>
                         <asp:ListItem>Create group</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="STEP 2: Please select the second  Person/Group" ForeColor="DodgerBlue" ></asp:Label>
                    <br />
                    <br />
                        <asp:DropDownList ID="dropDownBox2" runat="server" OnSelectedIndexChanged="dropDownBox2_SelectedIndexChanged" AutoPostBack="True" Height="28px" Width="177px">
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
                <td valign="top" style="border: 1px solid black" class="auto-style11" >
                    <asp:Panel ID="createGroupPanel" runat="server" visible="false" Width="308px">
                       <asp:Label ID="Label13" runat="server" Text="To create a group:" style="font-weight: 700" ForeColor="Brown"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" Text="STEP 1: Enter Group Name:" style="font-weight: 700" ForeColor="DodgerBlue" ></asp:Label>
                <br />
                
                <br />
                <asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="STEP 2: Select persons:" Font-Bold="True" ForeColor="DodgerBlue" ></asp:Label>
                    <br />
                    <br />
                    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
                    </asp:ListBox> 
                    <br />
                    <asp:HiddenField ID="grpMemHiddenField" runat="server" OnValueChanged="grpMemHiddenField_ValueChanged"  />
                       <asp:Panel ID="addgroupPanel" runat="server">
                          <div style="text-align:center">
                           <asp:Button ID="Button1" runat="server" OnClick="btnAddGroup_Click" Text="Add Group"  />
                           </div>
                       </asp:Panel>
                    <br />
                       <asp:Panel ID="groupButtonPanel" runat="server" Visible="False">
                           <div style="text-align:center">
                           &nbsp;&nbsp; <asp:Button ID="Addmembers" runat="server" Text="Add Members" OnClick="Addmembers_Click" ForeColor="Brown"/>&nbsp;&nbsp;<asp:Button ID="Removemember" runat="server" Text="Remove Members" OnClick="Removemember_Click" ForeColor="Brown" />
                           </div>
                               <br />
                           <div style="text-align:center">
                           <asp:Button ID="Button2" runat="server" OnClick="btnRemoveGroup_Click" Text="Remove Group" ForeColor="Brown" /> 
                                </div>
                       </asp:Panel>
                   </asp:Panel>
                </td>
               
           <td valign="top" style="border: 1px solid black; " class="auto-style15">
               <asp:Label ID="Label3" runat="server" Text="STEP3:Choose Relationships" Font-Bold="True" ForeColor="DodgerBlue" ></asp:Label>
                    <br />
               <br />
               <div style="overflow:hidden; height:auto; float:left; text-align:justify; margin-bottom:15px">
               <div style="width:auto; float:left; margin:0 12px 12px 0">
                   <asp:Label ID="Label7" runat="server" Font-Bold="true" ForeColor="PaleVioletRed" Text="Family">
                    </asp:Label>
                  <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" 
                   RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0 
                   BorderColor="SeaGreen" BorderWidth="2" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
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
                   
               
&nbsp;<br />
                    <%--<div style="float:left; width:auto;display:inline-block">--%>
                    <asp:Label  ID="Label4" runat="server" Font-Bold="true" ForeColor="PaleVioletRed" Text="Partner">
                    </asp:Label>
               &nbsp;<asp:CheckBoxList ID="CheckBoxList4" runat="server" RepeatDirection="Horizontal" 
        RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0 BorderColor="SeaGreen" BorderWidth="2">
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Spouse</asp:ListItem>
                   <asp:ListItem>M</asp:ListItem>
                   <asp:ListItem>Lovers</asp:ListItem>
                   <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
                    </div>
             
                  
                   
               &nbsp;
            <%--</td>
            <td valign="top" style="border: 1px solid black">
                <div style="width:750px;overflow:hidden; height:auto; float:left; text-align:justify; margin-bottom:15px;border:1px solid #000">--%>
                <div style="width:auto; float:left; margin:0 12px 12px 0">
                      <asp:Label ID="Label5" runat="server" Font-Bold="true" ForeColor="PaleVioletRed" Text="Reciprocity">
                    </asp:Label>
            &nbsp;<asp:CheckBoxList ID="CheckBoxList3" runat="server" RepeatDirection="Horizontal" 
        RepeatColumns="2" RepeatLayout="Table" TextAlign="Right" Width="285px" float="left" 
                   CellSpacing="1" white-space="nowrap" height="12px" overflow="hidden" margin=0 padding=0 BorderColor="SeaGreen" BorderWidth="2" valign="top">
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
                    <br />
                <asp:Label ID="Label6" runat="server" Font-Bold="true" ForeColor="PaleVioletRed" Text="Hierarchical">
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
                    <br />
                </div>
                    </div>
             
            </td>
        
             <td class="auto-style16"></td>
            <td class="auto-style16"></td>
           
            </tr>
            </table>
            <br />
             </div>
            <div style="text-align:center">
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="184px" OnClick="btnAdd_Click" Font-Size="Large" ForeColor="Brown" CssClass="auto-style12" />
               </div>
                <br />
            <br />
            
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" Height="95px" Width="628px" >
              <Columns>
                  <asp:TemplateField>
                        <itemtemplate>
                            <asp:checkbox ID="cbSelect" runat="server" ></asp:checkbox>
                         </itemtemplate> 
                      <ItemStyle HorizontalAlign="Center" />
                  </asp:TemplateField>
                <asp:BoundField DataField="person1" HeaderText="Person1" SortExpression="" ItemStyle-ForeColor="SeaGreen" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Brown"/>
                <asp:BoundField DataField="person2" HeaderText="Person2"  SortExpression="" ItemStyle-ForeColor="SeaGreen" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Brown"/>
                <asp:BoundField DataField="relationship" HeaderText="Relationship" SortExpression="" ItemStyle-ForeColor="SeaGreen" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Brown"/>
            </Columns>
        </asp:GridView> 
                
            <br /> 
            <br />  
            <div style="text-align:center">  
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Width="159px" ForeColor="Brown"  Font-Size="Large" />&nbsp;&nbsp; <asp:Button ID="Button5" runat="server" Text="Remove" OnClick="Button5_Click" Width="144px" ForeColor="Brown"  Font-Size="Large" />
     </div>
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
                               if (result == "") {
                                   alert("please click within the box");
                               } else {
                                   var hidvalue = document.getElementById("grpMemHiddenField").value;
                                   //var listbox = document.getElementById("ListBox1");
                                   //var newOption = window.document.createElement('OPTION');
                                   //newOption.text = result;
                                   //newOption.value = result;
                                   //listbox.options.add(newOption);                                  
                                   hidvalue =result;
                                   document.getElementById("grpMemHiddenField").value = hidvalue;
                                   __doPostBack(document.getElementById('grpMemHiddenField').name, '')
                               }
                             
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
            
    </form>

    
</body>
</html>
