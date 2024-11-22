using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows;
using QuanLyBenhVien.Model;
using QuanLyBenhVien.Repositories;

namespace QuanLyBenhVien.ViewModel
{
    internal class MainViewModel : ViewModelBase
    {
        //fields
        private UserAccountModel _currentUserAccount;
        private IUserRepository _userRepository;

        internal UserAccountModel CurrentUserAccount { get => _currentUserAccount; set { _currentUserAccount = value; OnPropertyChanged(nameof(CurrentUserAccount)); } }
        public MainViewModel()
        {
            _userRepository = new UserRepository();
            CurrentUserAccount = new UserAccountModel();
            LoadCurrentUserData();
        }

        private void LoadCurrentUserData()
        {
            //var user = _userRepository.GetByID("abcxyz");
            var user = _userRepository.GetByID(Thread.CurrentPrincipal.Identity.Name);
            if (user != null) 
            {
                CurrentUserAccount.UserID = user.Id;
                CurrentUserAccount.DisplayName = $"Welcome {user.LastName} {user.FirstName} ;)";
                CurrentUserAccount.ProfilePicture = null;
            }
            else
            {
                CurrentUserAccount.DisplayName= "Đăng nhập không hợp lệ!!!";
                //Application.Current.Shutdown();
            }
        }
    }
}
