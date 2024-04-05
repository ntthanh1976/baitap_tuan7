using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
namespace WebQLHoa
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string textFile = Server.MapPath("~/Counter.txt");
            //doc tu file
            int demluot = int.Parse(File.ReadAllText(textFile));          
            Application["DemLuot"] = demluot;            
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();          
            Application["DemLuot"] = (int)Application["DemLuot"] + 1;
            //ghi vào file
             string textFile = Server.MapPath("~/Counter.txt");
             File.WriteAllText(textFile,Application["DemLuot"].ToString());
            Application.UnLock();            
        }

    }
}