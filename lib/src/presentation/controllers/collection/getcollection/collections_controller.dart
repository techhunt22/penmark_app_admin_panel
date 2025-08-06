import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/collection/get_collection_entities.dart';
import '../../../../domain/usecases/collection/get_collections_usecase.dart';
import '../../template/addtemplate/add_template_controller.dart';
import 'collections_cache_class.dart';

class CollectionsController extends GetxController {
  final GetCollectionsUseCase getCollectionsUseCase;
  final CollectionsCache cache;

  CollectionsController(this.getCollectionsUseCase, this.cache);

  var collections = <GetCollectionDataEntity>[].obs;
  var collectionsList = <GetCollectionDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  var totalPages = 1.obs; // Total pages from API
  var currentPage = 1.obs; // Current page
  var forceRefresh = false.obs;
  var collectionDropdownItems = <CollectionItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCollections();
    Timer.periodic(Duration(minutes: 10), (timer) {
      fetchCollections(); // This will automatically refresh the data if expired
    });
  }

  // Collection Name and Id
  Future<void> collectionList() async {

    isLoading.value = true;

    final result = await getCollectionsUseCase.collectionsUseCase(
      page: 1,
      limit: 0, // get all
    );

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        collectionsList.clear();
        collectionDropdownItems.clear();
      },
      (success) {
        errorMessage.value = '';

        collectionsList.assignAll(success.data);

        // Extract name and id for dropdown
        final dropdownData = success.data
            .map((e) => CollectionItem(id: e.id, name: e.name))
            .toList();

        print("Collections: ${collectionsList.length}");
        print("CollectionItems Loaded: ${collectionsList.length}");

        collectionDropdownItems.assignAll(dropdownData);
      },
    );

    isLoading.value = false;
  }

  Future<void> fetchCollections() async {
    errorMessage.value = '';

    if (forceRefresh.value) {
      cache.clearCache();
    }

    if (!forceRefresh.value && cache.containsPage(currentPage.value)) {
      collections.assignAll(cache.getPage(currentPage.value)!);
      cache.logCacheUsage();
      return;
    }
    isLoading.value = true;

    final result = await getCollectionsUseCase.collectionsUseCase(
      page: currentPage.value,
      limit: 5,
    );

    result.fold(
      (failure) {
        totalPages.value = 0;
        currentPage.value = 0;
        errorMessage.value = failure.message;
        collections.clear(); // Prevent previous stale data from showing
      },
      (success) {
        errorMessage.value = '';

        collections.assignAll(success.data);
        totalPages.value = success.pagination.totalPages;
        currentPage.value = success.pagination.currentPage;
        currentPage.value = success.pagination.currentPage;

        // Cache the fetched data
        cache.cachePage(currentPage.value, success.data);
        cache.logCacheUsage();

        if (kDebugMode) {
          print(
              'Total Pages: ${totalPages.value} Current Page: ${currentPage.value}');
        }
      },
    );

    isLoading.value = false;
    forceRefresh.value = false;
  }

  void goToPage(int page) {
    if (page > 0 && page <= totalPages.value) {
      currentPage.value = page;
      fetchCollections();
    }
  }

  void nextPage() => goToPage(currentPage.value + 1);

  void previousPage() => goToPage(currentPage.value - 1);

  void clearCache() => cache.clearCache();


  void refreshData() {
    if (currentPage.value < 1) {
      currentPage.value = 1;
    }
    forceRefresh.value = true;
    fetchCollections();
  }
}
