using QuanLyBenhVien.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using QuanLyBenhVien.Repositories;
using System.Net;
using System.Security.Principal;

namespace QuanLyBenhVien.ViewModel
{
    internal class LoginViewModel : ViewModelBase
    {
        //fields
        private string? _userID;
        private SecureString? _password;
        private string? _errorMessage;
        private bool _isViewVisible = true;

        private IUserRepository userRepository;

        //properties
        public string? UserID
        {
            get => _userID;
            set
            {
                _userID = value;
                OnPropertyChanged(nameof(UserID));
            }
        }
        public SecureString? Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }
        public string? ErrorMessage
        {
            get => _errorMessage;
            set
            {
                _errorMessage = value;
                OnPropertyChanged(nameof(ErrorMessage));
            }
        }
        public bool IsViewVisible
        {
            get => _isViewVisible;
            set
            {
                _isViewVisible = value;
                OnPropertyChanged(nameof(IsViewVisible));
            }
        }

        // -> commands
        public ICommand LoginCommand { get; }
        public ICommand RecoverPasswordCommand { get; }
        public ICommand ShowPasswordCommand { get; }
        public ICommand RememberCommand { get; }

        //constructors
        public LoginViewModel()
        {
            userRepository = new UserRepository();
            LoginCommand = new ViewModelCommand(ExecuteLoginCommand, CanExecuteLoginCommand);
            RecoverPasswordCommand = new ViewModelCommand(p => ExecuteRecoverPassCommand("", ""));
        }

        private void ExecuteRecoverPassCommand(string userID, string email)
        {
            throw new NotImplementedException();
        }

        private bool CanExecuteLoginCommand(object obj)
        {
            bool validData;
            if (string.IsNullOrWhiteSpace(UserID) || Password == null)
                validData = false;
            else validData = true;
            return validData;
        }

        private void ExecuteLoginCommand(object obj)
        {
            var isValidUser = userRepository.AuthenticateUser(new NetworkCredential(UserID, Password));
            if (isValidUser)
            {
                Thread.CurrentPrincipal = new GenericPrincipal(new GenericIdentity(UserID), null);
                IsViewVisible = false;
            }
            else
            {
                ErrorMessage = "    * Mã nhân viên hoặc mật khẩu không đúng!";
            }
        }
    }
}
