class ListAPI {
  ListAPI._();

  //BASE URL
  static const String baseUrl = "https://penmark.techhunt.info/api/admin/";




  //Create Account API ENDPOINT
  static const String login = "login";
  static const String addtemplate = "add-template";


  static String deleteaccount(String id) {
    return "/accounts/$id";
  }



}