using QuanLyBenhVien.Model;
//using System.Data.SqlClient;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Identity.Client.Platforms.Features.DesktopOs.Kerberos;
using System.Windows.Controls;

namespace QuanLyBenhVien.Repositories
{
    public class UserRepository : RepositoryBase, IUserRepository
    {
        public void Add(UserModel userModel)
        {
            throw new NotImplementedException();
        }

        public bool AuthenticateUser(NetworkCredential credential)
        {
            bool validUser;
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from NhanVien where MaNhanVien=@userID and MatKhau=@password";
                command.Parameters.Add("@userID", System.Data.SqlDbType.NVarChar).Value = credential.UserName;
                command.Parameters.Add("@password", System.Data.SqlDbType.NVarChar).Value = credential.Password;
                validUser = command.ExecuteScalar() == null ? false : true;
            }
            return validUser;
        }

        public void Edit(UserModel userModel)
        {
            throw new NotImplementedException();
        }

        public UserModel GetByID(int id)
        {
            throw new NotImplementedException();
        }

        public UserModel GetByID(string? name)
        {
            UserModel user = null;
            using (var connection = GetConnection())
            using (var command = new SqlCommand())
            {
                connection.Open();
                command.Connection = connection;
                command.CommandText = "select * from NhanVien where MaNhanVien=@userID";
                command.Parameters.Add("@userID", System.Data.SqlDbType.NVarChar).Value = name;
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        user = new UserModel()
                        {
                            Id = reader[0].ToString(),
                            Password = string.Empty,
                            FirstName = reader[2].ToString(),
                            LastName = reader[3].ToString(),
                            Email = reader[4].ToString()
                        };
                    }
                }
            }
            return user;
        }

        public void Remove(int id)
        {
            throw new NotImplementedException();
        }
    }
}
