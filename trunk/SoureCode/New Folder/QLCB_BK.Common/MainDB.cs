using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QLCB_BK.Common
{
    public class MainDB : IDisposable
    {
        private IDbConnection dbConnection;

        public MainDB(string connectionString)
        {
            dbConnection = new System.Data.SqlClient.SqlConnection(connectionString);
            dbConnection.Open();
        }

        public MainDB()
        {
            dbConnection = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["QLCB"].ConnectionString);
            dbConnection.Open();
        }

        public DataTable Execute(string spName, string[] parNames, object[] parValues)
        {
            try
            {
                SqlCommand sqlCmd = (SqlCommand)dbConnection.CreateCommand();
                sqlCmd.CommandText = spName;
                sqlCmd.CommandType = CommandType.StoredProcedure;

                int n = parNames.Length;
                for (int i = 0; i < n; i++)
                {
                    SqlParameter sqlParam = new SqlParameter();
                    sqlParam.ParameterName = (string)parNames.GetValue(i);
                    sqlParam.Value = parValues.GetValue(i);
                    sqlCmd.Parameters.Add(sqlParam);
                }

                DataTable dataTable = new DataTable();
                new System.Data.SqlClient.SqlDataAdapter((System.Data.SqlClient.SqlCommand)sqlCmd).Fill(dataTable);
                return dataTable;
            }
            catch (Exception myException)
            {
                throw (new Exception(myException.Message));
            }
        }

        public IDbConnection Connection
        {
            get { return dbConnection; }
        }

        public virtual void Dispose()
        {
            if (null != dbConnection)
                dbConnection.Close();

            if (null != dbConnection)
                dbConnection.Dispose();
        }
    }
}
