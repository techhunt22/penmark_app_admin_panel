
import 'dart:async';

import 'package:coloring_app_admin_panel/src/domain/usecases/user/get_users_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/user/users_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../domain/entities/user/get_user_entity.dart';


class GetUsersController extends GetxController{
  final GetUsersUseCase getUsersUseCase;
  final UsersCache cache;

  GetUsersController(this.getUsersUseCase, this.cache);

  var users = <GetUsersDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  var totalPages = 1.obs; // Total pages from API
  var currentPage = 1.obs; // Current page
  var forceRefresh = false.obs;



  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Fetch data on initialization

    Timer.periodic(Duration(minutes: 10), (timer) {
      fetchUsers(); // This will automatically refresh the data if expired
    });

  }

  Future<void> fetchUsers({int limit = 5})async {
    if (forceRefresh.value) {
      cache.clearCache();
    }

    if (cache.containsPage(currentPage.value)) {
      users.assignAll(cache.getPage(currentPage.value)!);
      cache.logCacheUsage();
      return;
    }

    isLoading.value = true;

    final result = await getUsersUseCase.getUsersUseCase(
      page: currentPage.value,
      limit: limit,
    );


    result.fold(
          (failure) {
            totalPages.value = 0;
            currentPage.value = 0;
            errorMessage.value = failure.message;
            users.clear();

          },
          (success) {
            users.assignAll(success.data);
            totalPages.value = success.pagination.totalPages;
            currentPage.value = success.pagination.currentPage;

            // Cache the fetched data
            cache.cachePage(currentPage.value, success.data);
            cache.logCacheUsage();

        if (kDebugMode) {
          print('USERS Total Pages: ${totalPages.value} Current Page: ${currentPage.value}');
        }
      },
    );


    isLoading.value = false;
    forceRefresh.value = false;

  }


  String getInitials(String fullname) {
    List<String> nameParts = fullname.split(' '); // Split by space to get first and last name
    String initials = '';

    if (nameParts.isNotEmpty) {
      initials += nameParts[0][0]; // First letter of the first name
    }
    if (nameParts.length > 1) {
      initials += nameParts[1][0]; // First letter of the last name (if present)
    }

    return initials.toUpperCase(); // Ensure initials are uppercase
  }


  void goToPage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page;
      fetchUsers();
    }
  }

  void nextPage() => goToPage(currentPage.value + 1);
  void previousPage() => goToPage(currentPage.value - 1);



  void clearCache() => cache.clearCache();


  void refreshData() {
    forceRefresh.value = true;
    fetchUsers();
  }

}