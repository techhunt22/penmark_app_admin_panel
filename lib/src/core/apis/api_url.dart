class ListAPI {
  ListAPI._();

  //BASE URL
  static const String baseUrl = "https://penmark.techhunt.info/api/admin/";




  //Create Account API ENDPOINT
  static const String login = "login";
  static const String addtemplate = "add-template";
  static const String getcollections = "get-collections";
  static const String gettemplates = "get-templates";
  static const String getusers = "get-users";
  static const String getorders = "get-all-orders";


  static String deleteaccount(String id) {
    return "/accounts/$id";
  }



}