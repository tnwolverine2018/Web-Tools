using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;

namespace Web_Based_Web_Scraper
{
    public class MySession
    {
        // private constructor
        private MySession()
        {
            sqlServer = ReadSetting("sqlServer");
            sqlUser = ReadSetting("sqlUser");
            sqlPassword = ReadSetting("sqlPassword");
            sqlDB = ReadSetting("sqlDB");


            setConnectionStringSQL(sqlDB);


        }

        // Gets the current session.
        public static MySession Current
        {
            get
            {
                MySession session =
                  (MySession)HttpContext.Current.Session["__MySession__"];
                if (session == null)
                {
                    session = new MySession();
                    HttpContext.Current.Session["__MySession__"] = session;
                }
                return session;
            }
           
        }



        private static string ReadSetting(string key)
        {

            string value = string.Empty;
            try
            {
                var appSettings = ConfigurationManager.AppSettings;
                value = appSettings[key] ?? "Not Found";

            }
            catch (ConfigurationErrorsException)
            {
                value = "Error reading app settings";

                //Console.WriteLine("Error reading app settings");
            }

            return value;

        }

        public  void setUsername(string username)
        {

            MyUserName = username;


        }


        public void setURL(string myurl)
        {

            CurrentURL = myurl;


        }

        private void setConnectionStringSQL(string dbname)
        {


           
            try
            {
                string server = sqlServer;
                string sqluser = sqlUser;
                string sqlpassword = sqlPassword;



                System.Data.SqlClient.SqlConnectionStringBuilder builder =
      new System.Data.SqlClient.SqlConnectionStringBuilder();
                builder["Data Source"] = server;
                builder["integrated Security"] = false;
                builder.InitialCatalog = dbname;
                builder.UserID = sqluser;

                sqlDB = dbname;

                builder.Password = sqlpassword;
               sqlConnectionString = builder.ConnectionString;

               

            }
            catch (Exception ex)
            {

                sqlConnectionString = ex.Message;


            }



            


        }





        // **** add your session properties here, e.g like this:
        public string sqlServer { get; set; }
        public string sqlUser { get; set; }
        public string sqlPassword { get; set; }

        public string sqlConnectionString { get; set; }

        public string MyUserName { get; set; }

        public string sqlDB { get; set; }

        public string CurrentURL { get; set; }
    }
}