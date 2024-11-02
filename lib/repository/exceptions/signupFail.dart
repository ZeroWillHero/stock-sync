class SignUpEmailAndPasswordFail {
  final String message;

  SignUpEmailAndPasswordFail([this.message = "An Unknown Error Occured"]);

  factory SignUpEmailAndPasswordFail.code(String code){
    switch(code){
      case '':
        return SignUpEmailAndPasswordFail("An Unknown Error Occured");
      case 'email-already-in-use':
        return SignUpEmailAndPasswordFail("Email is already in use");
      case 'weak-password':
        return SignUpEmailAndPasswordFail("Password is too weak");
      default:
        return SignUpEmailAndPasswordFail("An Unknown Error Occured");
    }
  }
}
