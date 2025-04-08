abstract class RegisterRequest {
  String email;
  String password;
  String firstName;
  String lastName;

  RegisterRequest(this.email, this.password, this.firstName, this.lastName);
}
