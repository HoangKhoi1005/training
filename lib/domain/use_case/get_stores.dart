part of my_domain;

final class GetStoresUseCase {
  final StoreRepository storeRepository;

  const GetStoresUseCase({required this.storeRepository});

  Future<List<Store>> call(String toolName) {
    return storeRepository.getStores(toolName);
  }

  Future<Store> getStoreById(int storeId) {
    return storeRepository.getStore(storeId);
  }
}