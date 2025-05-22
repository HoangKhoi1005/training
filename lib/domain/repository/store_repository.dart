part of my_domain;

abstract class StoreRepository {
  const StoreRepository();

  Future<List<Store>> getStores(String toolName);
}