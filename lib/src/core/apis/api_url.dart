class ListAPI {
  ListAPI._();

  //BASE URL
  static const String baseUrl = "http://178.16.130.192:5000/api/admin/";



  //Create Account API ENDPOINT
  static const String login = "login";


  static String deleteaccount(String id) {
    return "/accounts/$id";
  }




}