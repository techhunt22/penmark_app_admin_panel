class ListAPI {
  ListAPI._();

  //BASE URL
  static const String baseUrl = "https://shahzaib.techhunt.info/api/admin/";



  //Create Account API ENDPOINT
  static const String login = "login";


  static String deleteaccount(String id) {
    return "/accounts/$id";
  }




}