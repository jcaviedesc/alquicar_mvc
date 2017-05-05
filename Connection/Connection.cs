using MySql.Data;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Connection
{
    public class Connection
    {
        private static string stringConnection = ConfigurationManager.ConnectionStrings["conexion_mysql"].ConnectionString;

        public MySqlConnection ConexionMySQL()
        {
            MySqlConnection Connection = new MySqlConnection(stringConnection);

            try
            {
                Connection.Open();
            }
            catch (Exception exc)
            {
                throw new Exception("No se realizó la conexión a la base de pameters: " + exc.Message);
            }

            return Connection;
        }

        public DataTable Query(string procedure, Parameter[] pameters)
        {
            DataTable data = new DataTable();
            MySqlConnection mySqlConnection = ConexionMySQL();
            MySqlCommand mySqlCommand = new MySqlCommand();
            mySqlCommand.CommandText = procedure;
            mySqlCommand.CommandType = CommandType.StoredProcedure;

            if (pameters != null)
            {
                for (int i = 0; i < pameters.Length; i++)
                {
                    mySqlCommand.Parameters.AddWithValue(pameters[i].Name, pameters[i].Value);
                }
            }

            mySqlCommand.Connection = mySqlConnection;

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(mySqlCommand);
                da.Fill(data);
                return data;
            }
            catch (Exception exc)
            {
                throw new Exception("Sentencia SQL de consulta inválida: " + exc.Message);
            }
            finally
            {
                mySqlConnection.Close();
                mySqlConnection.Dispose();
            }
        }

        public bool Transaction(Transaction[] list)
        {
            bool state = false;
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = null;
            conn = ConexionMySQL();

            MySqlTransaction Transa = conn.BeginTransaction();

            try
            {
                for (int i = 0; i < list.Length; i++)
                {
                    if (list[i] == null) continue;

                    cmd = new MySqlCommand(list[i].Procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (Parameter obj in list[i].Parameters)
                    {

                        cmd.Parameters.Add(obj.Name, obj.Value);

                    }
                    cmd.Transaction = Transa;
                    cmd.ExecuteNonQuery();
                }
                Transa.Commit();
                conn.Close();
                conn.Dispose();
                Transa.Dispose();
                state = true;
            }
            catch (Exception ex)
            {
                Transa.Rollback();
                conn.Close();
                conn.Dispose();
                state = false;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
            }
            return state;
        }
    }
}
