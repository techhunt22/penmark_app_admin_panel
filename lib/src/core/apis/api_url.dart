import 'dart:core';

class ListAPI {
  ListAPI._();

  //BASE URL
  static const String baseUrl = "https://penmark.techhunt.info/api/admin/";


  // AUTH
  static const String login = "login";

  // TEMPLATE
  static const String addTemplate = "add-template";
  static const String getTemplates = "get-templates";
  static String updateTemplate(String id) {
    return "update-template/$id";
  }
  static String deleteTemplate(String id) {
    return "delete-template/$id";
  }




  // COLLECTION
  static const String getCollections = "get-collections";
  static const String addCollections = "add-collection";
  static String updateCollection(String id) {
    return "update-collection/$id";
  }

  static String deleteCollection(String id) {
    return "delete-collection/$id";
  }




  // USERS
  static const String getUsers = "get-users";
  static String updateUser(String id) {
    return "update-user-status/$id";
  }
  static String deleteUser(String id) {
    return "delete-user/$id";
  }

  // ORDERS
  static const String getOrders = "get-all-orders";



  // PAPER SIZE

  static const String getPaperSize = "list-papersizes";
  static const String addPaperSize = "add-papersize";

  static String updateSize(String id) {
    return "update-papersize/$id";
  }
  static String deletePaperSize(String id) {
    return "delete-papersize/$id";
  }

  // PAPER TYPE

  static const String getPaperType = "/list-papertypes";
  static const String addPaperType = "add-papertype";

  static String updateType(String id) {
    return "update-papertype/$id";
  }
  static String deletePaperType(String id) {
    return "delete-papertype/$id";
  }
 // CHARGES

  static const String getCharges = "/list-charges";

  static String updateCharges(String id) {
    return "update-charges/$id";
  }





}