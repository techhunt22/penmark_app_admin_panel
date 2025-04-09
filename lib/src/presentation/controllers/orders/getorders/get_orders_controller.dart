
import 'dart:async';
import 'package:coloring_app_admin_panel/src/domain/entities/orders/get_orders_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/orders/get_orders_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'orders_cache.dart';


class GetOrdersController extends GetxController{
  final GetOrdersUseCase getOrdersUseCase;
  final OrdersCache cache;

  GetOrdersController(this.getOrdersUseCase, this.cache);

  var orders = <OrdersDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  var totalPages = 1.obs; // Total pages from API
  var currentPage = 1.obs; // Current page
  var forceRefresh = false.obs;



  @override
  void onInit() {
    super.onInit();
    fetchOrders(); // Fetch data on initialization

    Timer.periodic(Duration(minutes: 10), (timer) {
      fetchOrders(); // This will automatically refresh the data if expired
    });

  }

  Future<void> fetchOrders({int limit = 5})async {
    if (forceRefresh.value) {
      cache.clearCache();
    }

    if (cache.containsPage(currentPage.value)) {
      orders.assignAll(cache.getPage(currentPage.value)!);
      cache.logCacheUsage();
      return;
    }

    isLoading.value = true;

    final result = await getOrdersUseCase.getOrdersUseCase(
      page: currentPage.value,
      limit: limit,
    );

    result.fold(
          (failure) {
            totalPages.value = 0;
            currentPage.value = 0;
            errorMessage.value = failure.message;
            orders.clear(); // Prevent previous stale data from showing

          },
          (success) {
            orders.assignAll(success.orders);
            totalPages.value = success.pagination.totalPages;
            currentPage.value = success.pagination.currentPage;

            // Cache the fetched data
            cache.cachePage(currentPage.value, success.orders);
            cache.logCacheUsage();

            if (kDebugMode) {
              print('Total Pages: ${totalPages.value} Current Page: ${currentPage.value}');
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

  String getDate (DateTime time){
    String formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(time);

    return formattedDate;
  }


  void goToPage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page;
      fetchOrders();
    }
  }

  void nextPage() => goToPage(currentPage.value + 1);
  void previousPage() => goToPage(currentPage.value - 1);



  void clearCache() => cache.clearCache();


  void refreshData() {
    forceRefresh.value = true;
    fetchOrders();
  }

}