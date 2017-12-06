using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnnotationApplication
{
    public partial class Annotationform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Creating a list to store the relation
                List<AnnotationDetail> relationList = new List<AnnotationDetail>();
                Session["relationList"] = relationList;
                // Creating a Map to store the groups
                Dictionary<String, List<String>> groupMap = new Dictionary<String, List<String>>();
                Session["groupMap"] = groupMap;
                //to load the video using samping algorithm
                string[] files = Directory.GetFiles(@"C:\Users\T450s\Documents\Visual Studio 2015\Projects\AnnotationApplication\AnnotationApplication\Videos", "*.mp4");
                Random rand = new Random();
                int i = rand.Next(0, files.Length - 1);
                String s = files[i];
                String file = "Videos/" + s.Substring(s.LastIndexOf("\\") + 1);
                Session["VideoName"] = s;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg", "startvideofrom();", true);
            }
        }
        [WebMethod]
        public static String getPersonDetails(String wi, String he, String curTime)
        {
            String result = "";
            String re = wi + " " + he;
            int totallength = 29;
            String currenttime = curTime;
            AnnotationDBEntities entities = new AnnotationDBEntities();
            var frame = entities.VideoDetails.Where(v => v.Video.video_Name.Contains("vid_001")).Select(v => v.frame_Vid_ID).Distinct().Count();
            int totTime = (int)Convert.ToDouble(totallength);

            int frameRate = Convert.ToInt32(frame) / totTime;

            int frameNo = Convert.ToInt32(frameRate * Convert.ToDouble(currenttime));

            int x = Convert.ToInt32(Convert.ToDouble(wi));
            int y = Convert.ToInt32(Convert.ToDouble(he));
            try
            {
                var boxes = entities.VideoDetails.Where(v => v.Video.video_Name.Contains("vid_001") && v.frame_Vid_ID == frameNo
                && (v.x <= x && (v.x + v.width) >= x) && (v.y <= y && (v.y + v.height) >= y)).Select(v => v.track_ID).Distinct().Cast<String>().First();

                result = "Person " + boxes.ToString();
            }
            catch (Exception ex)
            {
                result = "";
            }


            return result;
        }


        protected void curTimeHiddenField_ValueChanged(object sender, EventArgs e)
        {
            String videoName = "vid_001";

            int totallength = 29;
            String currenttime = curTimeHiddenField.Value;

            AnnotationDBEntities entities = new AnnotationDBEntities();

            var frame = entities.VideoDetails.Where(v => v.Video.video_Name.Contains(videoName)).Select(v => v.frame_Vid_ID).Distinct().Count();

            int totTime = (int)Convert.ToDouble(totallength);

            int frameRate = Convert.ToInt32(frame) / totTime;

            int frameNo = Convert.ToInt32(frameRate * Convert.ToDouble(currenttime));

            var boxes = entities.VideoDetails.Where(v => v.Video.video_Name.Contains(videoName) && v.frame_Vid_ID == frameNo).Select(v => v.track_ID).Distinct().Cast<String>().ToList();

            List<String> boxValues = boxes;

            var boxList = boxValues.Select(x => "Person " + x).ToList();
            boxList.Insert(0, "Please Select");
            boxList.Insert(1, "Create Group");
            dropDownBox1.DataSource = boxList;
            dropDownBox1.DataBind();

            dropDownBox2.DataSource = boxList;
            dropDownBox2.DataBind();

            //ListBox1.DataSource = boxList;
            //ListBox1.DataBind();

            //TextBox1.Text = "";
            //TextBox2.Text = "";

            //  dropDownBox1.Focus();

        }

        protected void dropDownBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dictionary<String, List<String>> groupMap = (Dictionary<String, List<String>>)Session["groupMap"];
            String box1SelectedValue = dropDownBox1.SelectedValue;
            ListItemCollection items = new ListItemCollection();
            items = dropDownBox1.Items;
            dropDownBox2.DataSource = items;
            dropDownBox2.DataBind();
            dropDownBox2.Items.Remove(box1SelectedValue);
            if (box1SelectedValue == "Create Group")
            {
                createGroupPanel.Visible = true;
            }
            else if (groupMap.ContainsKey(box1SelectedValue))
            {
                createGroupPanel.Visible = true;
                txtGroupName.Text = box1SelectedValue;
                List<String> persons = (List<String>)groupMap.Where(x => x.Key == box1SelectedValue).Select(x => x.Value).First();
                List<ListItem> groupElements = new List<ListItem>();
                foreach (String li in persons)
                {
                    if (!li.Equals(""))
                    {
                        ListItem listItem = new ListItem();
                        listItem.Value = li;
                        groupElements.Add(listItem);


                    }
                }
                ListBox1.DataSource = persons;
                ListBox1.DataBind();
                addgroupPanel.Visible = false;
                groupButtonPanel.Visible = true;
            }
            else
            {
                createGroupPanel.Visible = false;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            String selectedValue = "";
            foreach (ListItem lst in CheckBoxList1.Items)
            {
                if (lst.Selected == true)
                {
                    if (lst.Value == "M")
                    {
                        selectedValue = selectedValue + lst.Value + "-";
                    }
                    else
                    {
                        selectedValue += lst.Value + ",\n";
                    }
                }

            }
            foreach (ListItem lst in CheckBoxList2.Items)
            {
                if (lst.Selected == true)
                {
                    if (lst.Value == "M")
                    {
                        selectedValue = selectedValue + lst.Value + "-";
                    }
                    else
                    {
                        selectedValue += lst.Value + ",\n";
                    }
                }

            }
            foreach (ListItem lst in CheckBoxList3.Items)
            {
                if (lst.Selected == true)
                {
                    if (lst.Value == "M")
                    {
                        selectedValue = selectedValue + lst.Value + "-";
                    }
                    else
                    {
                        selectedValue += lst.Value + ",\n";
                    }
                }

            }
            foreach (ListItem lst in CheckBoxList4.Items)
            {
                if (lst.Selected == true)
                {
                    if (lst.Value == "M")
                    {
                        selectedValue = selectedValue + lst.Value + "-";
                    }
                    else
                    {
                        selectedValue += lst.Value + ",\n";
                    }
                }

            }

            String value1 = dropDownBox1.SelectedValue; //TextBox1.Text;
            String value2 = dropDownBox2.SelectedValue; //TextBox2.Text;
            AnnotationDetail relation = new AnnotationDetail();
            relation.frame_vid_ID = Convert.ToInt32(Convert.ToDouble(curTimeHiddenField.Value)) * 30;
            relation.person1 = value1;
            relation.person2 = value2;
            relation.relationship = selectedValue;
            if (selectedValue.Equals(""))
            {

            }
            List<AnnotationDetail> relList = (List<AnnotationDetail>)Session["relationList"];
            relList.Add(relation);
            Session["relationList"] = relList;
            GridView1.DataSource = relList;
            GridView1.DataBind();
            clearAllControls();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AnnotationDBEntities entities = new AnnotationDBEntities();
            // To add group members to database
            Dictionary<String, List<String>> groupMap = (Dictionary<String, List<String>>)Session["groupMap"];
            if (groupMap.Count() != 0)
            {
                foreach (String s in groupMap.Keys)
                {
                    String members = "";
                    List<String> persons = groupMap.Where(x => x.Key == s).Select(x => x.Value).First();
                    foreach (String p in persons)
                    {
                        members = members + p + ",";
                    }
                    // to add todb
                    Group group = new Group();
                    group.group_Name = s;
                    group.persons = members;
                    entities.Groups.Add(group);
                    entities.SaveChanges();
                }
            }
            //to add relation to annotation detail and annotation tables.
            Annotation annotation = new Annotation();
            annotation.video_ID = 1;
            entities.Annotations.Add(annotation);
            entities.SaveChanges();
            List<AnnotationDetail> relList = (List<AnnotationDetail>)Session["relationList"];
            foreach (AnnotationDetail relation in relList)
            {
                if (groupMap.ContainsKey(relation.person1))
                {
                    //String members = "";
                    //List<String> persons = groupMap.Where(x => x.Key == s).Select(x => x.Value).First();
                    //foreach (String p in persons)
                    //{
                    //    members = members + p + ",";
                    //}
                    //// to add todb
                    //Group group = new Group();
                    //group.group_Name = s;
                    //group.persons = members;
                    //entities.Groups.Add(group);
                    //entities.SaveChanges();
                }
                if (groupMap.ContainsKey(relation.person2))
                {

                }
                relation.Annotation = annotation;
                entities.AnnotationDetails.Add(relation);
                entities.SaveChanges();
            }

            Response.Redirect("thankYou.aspx");
        }

        protected void btnAddGroup_Click(object sender, EventArgs e)
        {
            String groupName = txtGroupName.Text;
            List<string> members = new List<String>();
            //List<ListItem> groupElements = new List<ListItem>();
            //List<String> groupMembers = new List<String>();
            ////getting values from the hidden field for field
            //String listItems = grpMemHiddenField.Value;
            //String[] itms = listItems.Split(',');
            //foreach (String li in itms)
            //{
            //    if (!li.Equals(""))
            //    {
            //        if (groupMembers.Contains(li))
            //            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('item already exists');", true);
            //        else
            //        {
            //            groupMembers.Add(li);
            //            ListItem listItem = new ListItem();
            //            listItem.Value = li;
            //            groupElements.Add(listItem);
            //        }

            //    }


            //    //}
            //}
            Dictionary<String, List<String>> groupMap = (Dictionary<String, List<String>>)Session["groupMap"];
            if (groupName == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('Please enter the group name');", true);
            }
            else
            {
                if (groupMap.ContainsKey(groupName))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('group name already exists');", true);
                }
                else
                {
                    ListItemCollection items= ListBox1.Items;
                   
                    foreach(ListItem li in items)
                    {
                        members.Add(li.Value);
                    }
                    groupMap.Add(groupName,members);
                    Session["groupMap"] = groupMap;
                    //adding group name to dropdowns
                    dropDownBox1.Items.Add(groupName);
                    dropDownBox2.Items.Add(groupName);
                    //removing items from dropdown
                    createGroupPanel.Visible = false;
                }
                //if (groupDownDown.Items.Count == 0)
                //    groupDownDown.Items.Add("Please Select");

                //groupDownDown.Items.Add(groupName);

                txtGroupName.Text = "";
                grpMemHiddenField.Value = "";

            }
            grpMemHiddenField.Value = "";
            foreach (String li in members)
            {
                dropDownBox1.Items.Remove(li);
            }
            //dropDownBox1.Items.Add(groupName);
            //dropDownBox2.Items.Add(groupName);
            foreach (String li in members)
            {
                dropDownBox2.Items.Remove(li);
            }
            

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i]
                                .Cells[0].FindControl("cbSelect");
                List<AnnotationDetail> list = (List<AnnotationDetail>)Session["relationList"];
                if (chk != null && chk.Checked)
                {
                    list.RemoveAt(i);
                }
                Session["relationList"] = list;
            }
            clearAllControls();
            GridView1.DataSource = Session["relationList"];
            GridView1.DataBind();
        }

        private void clearAllControls()
        {
            foreach (ListItem lst in CheckBoxList1.Items)
            {
                lst.Selected = false;
            }
            foreach (ListItem lst in CheckBoxList2.Items)
            {
                lst.Selected = false;
            }
            foreach (ListItem lst in CheckBoxList3.Items)
            {
                lst.Selected = false;
            }
            foreach (ListItem lst in CheckBoxList4.Items)
            {
                lst.Selected = false;
            }
            //TextBox1.Text = "";
            //TextBox2.Text = "";
            dropDownBox1.SelectedIndex = 0;
            dropDownBox2.SelectedIndex = 0;
        }

        protected void dropDownBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            String box2SelectedValue = dropDownBox2.SelectedValue;

        }

        protected void btnRemoveGroup_Click(object sender, EventArgs e)
        {
            if (txtGroupName.Text != null || txtGroupName.Text == "")
            {
                String grpName = txtGroupName.Text;
                //    AnnotationEntities entity = new AnnotationEntities();
                //    groupDetail gd = entity.groupDetails.Where(x => x.GroupName == grpName).Select(x => x).First();
                //    entity.groupDetails.Remove(gd);
                //    entity.SaveChanges();
                //    String members = gd.Person;
                //    List<String> persons = members.Split(',').ToList();
                Dictionary<String, List<String>> groupMap = (Dictionary<String, List<String>>)Session["groupMap"];
                if (groupMap.ContainsKey(grpName))
                {
                    List<String> persons = groupMap.Where(x => x.Key == grpName).Select(x => x.Value).First();
                    groupMap.Remove(txtGroupName.Text);
                    Session["groupMap"] = groupMap;

                    foreach (String s in persons)
                    {
                        if (!s.Equals(""))
                        {
                            dropDownBox1.Items.Add(s);
                            dropDownBox2.Items.Add(s);
                        }
                    }

                    dropDownBox2.Items.Remove(grpName);
                       dropDownBox1.Items.Remove(grpName);
                    //groupDownDown.Items.Remove(grpName);
                    txtGroupName.Text = "";
                    // ListBox2.Items.Clear();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('Group does not exists ');", true);
            }
        }

        protected void HiddenField1_ValueChanged(object sender, EventArgs e)
        {
            AnnotationDBEntities entities = new AnnotationDBEntities();
            String s = HiddenField1.Value;
            String[] s1 = s.Split(',');
            String videoName = "vid_001";

            int totallength = 29;
            String currenttime = curTimeHiddenField.Value;

            var frame = entities.VideoDetails.Where(v => v.Video.video_Name.Contains(videoName)).Select(v => v.frame_Vid_ID).Distinct().Count();


            int totTime = (int)Convert.ToDouble(totallength);

            int frameRate = Convert.ToInt32(frame) / totTime;

            int frameNo = Convert.ToInt32(frameRate * Convert.ToDouble(currenttime));

            int x = Convert.ToInt32(Convert.ToDouble(s1[0]));
            int y = Convert.ToInt32(Convert.ToDouble(s1[1]));
            try
            {
                var boxes = entities.VideoDetails.Where(v => v.Video.video_Name.Contains(videoName) && v.frame_Vid_ID == frameNo
           && (v.x <= x && (v.x + v.width) >= x) && (v.y <= y && (v.y + v.height) >= y)).Select(v => v.track_ID).Distinct().Cast<String>().First();


                String value = "Person " + boxes.ToString();
                if (s1[2].Equals("undefined"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('Please select the Person 1 or Person 2 Text Box');", true);
                }
                else
                {
                    //TextBox textbox = (TextBox)this.FindControl(s1[2]);
                    //textbox.Text = value;
                    DropDownList dropdown = (DropDownList)this.FindControl(s1[2]);
                    int index = 0;
                    foreach (ListItem li in dropdown.Items)
                    {
                        if (value.Equals(li.Value))
                        {

                            break;
                        }
                        index++;
                    }
                    dropdown.SelectedIndex = index;

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('Please click inside boundary boxes');", true);
            }
        }
        protected void Removemember_Click(object sender, EventArgs e)
        {
            // ListBox1.Items.RemoveAt(ListBox1.Items.IndexOf(ListBox1.SelectedItem));
            String grpName = txtGroupName.Text;
            List<ListItem> deletedItems = new List<ListItem>();
            Dictionary<String, List<String>> groupMap = (Dictionary<String, List<String>>)Session["groupMap"];
            List<String> persons = groupMap.Where(x => x.Key == grpName).Select(x => x.Value).First();
            foreach (ListItem item in ListBox1.Items)
            {
                if (item.Selected)
                {
                    persons.Remove(item.Value);
                    deletedItems.Add(item);

                }
            }

            foreach (ListItem item in deletedItems)
            {
                ListBox1.Items.Remove(item);
            }
        }
        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void Addmembers_Click(object sender, EventArgs e)
        {
            String grpName = txtGroupName.Text;
            String val = grpMemHiddenField.Value;
            String[] s1 = val.Split(',');
            Dictionary<String, List<String>> groupMap = (Dictionary<String, List<String>>)Session["groupMap"];
            List<String> persons = groupMap.Where(x => x.Key == grpName).Select(x => x.Value).First();
            foreach (string s in s1)
            {
                if (s != "")
                {
                    ListBox1.Items.Add(s);
                    persons.Add(s);

                }
            }


        }

        protected void grpMemHiddenField_ValueChanged(object sender, EventArgs e)
        {
            String value = grpMemHiddenField.Value;
            
          
            ListItemCollection items = ListBox1.Items;
            if (items.Contains(new ListItem(value)))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", "alert('person already exists');", true);
                //items.Remove(value);
            }
            else
            {
                ListBox1.Items.Add(value);
                grpMemHiddenField.Value = "";
            }
        }



        //   List<String> boxValues = boxes;




        //    var boxList = boxValues.Select(z => "Person " + z).ToList();

    }
}

