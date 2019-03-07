class User
{
  String userName;
  String password;


  User(String u, String p) {
    this.userName = u;
    this.password = p;
  }

  User.EmptyConstructor() {

  }

  bool isValidLogin(){
    return this.userName == "hello" && this.password =="world";
  }

  void setUserName(String username){
    this.userName = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

}