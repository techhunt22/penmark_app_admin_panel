
import 'dart:async';

import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/get_templates_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/templates_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class TemplatesController extends GetxController{
  final GetTemplatesUseCase getTemplatesUseCase;
  final TemplatesCache cache;

  TemplatesController(this.getTemplatesUseCase, this.cache);

  var templates = <GetTemplatesDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  var totalPages = 1.obs; // Total pages from API
  var currentPage = 1.obs; // Current page
  var forceRefresh = false.obs;



  @override
  void onInit() {
    super.onInit();
    fetchTemplates(); // Fetch data on initialization

    Timer.periodic(Duration(minutes: 10), (timer) {
      fetchTemplates(); // This will automatically refresh the data if expired
    });

  }

  Future<void> fetchTemplates({int limit = 5})async {
    if (forceRefresh.value) {
      cache.clearCache();
    }

    if (cache.containsPage(currentPage.value)) {
      templates.assignAll(cache.getPage(currentPage.value)!);
      cache.logCacheUsage();
      return;
    }

    isLoading.value = true;

    final result = await getTemplatesUseCase.gettemplatesUseCase(
      page: currentPage.value,
      limit: limit,
    );

    result.fold(
          (failure) {
            totalPages.value = 0;
            currentPage.value = 0;
            errorMessage.value = failure.message;
            templates.clear(); // Prevent previous stale data from showing
      },
          (success) {
            templates.assignAll(success.data);
            totalPages.value = success.pagination.totalPages;
            currentPage.value = success.pagination.currentPage;

            // Cache the fetched data
            cache.cachePage(currentPage.value, success.data);
            cache.logCacheUsage();

        if (kDebugMode) {
          print('Total Pages: ${totalPages.value} Current Page: ${currentPage.value}');
        }
      },
    );


    isLoading.value = false;
    forceRefresh.value = false;

  }


  void goToPage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page;
      fetchTemplates();
    }
  }

  void nextPage() => goToPage(currentPage.value + 1);
  void previousPage() => goToPage(currentPage.value - 1);



  void clearCache() => cache.clearCache();


  void refreshData() {
    forceRefresh.value = true;
    fetchTemplates();
  }

}