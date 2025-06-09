import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:training/domain/domain.dart';

class MockStoreRepository extends Mock implements StoreRepository {}

void main() {
  late MockStoreRepository mockStoreRepository;
  late GetStoresUseCase getStoresUseCase;

  setUp(() {
    mockStoreRepository = MockStoreRepository();
    getStoresUseCase = GetStoresUseCase(storeRepository: mockStoreRepository);
  });

  test('should return a list of stores from the repository', () async {
    final toolName = 'testTool';
    final expectedStores = [
      Store(
        storeId: 1,
        name: 'Store 1',
        logoPath: '',
        distanceKm: 0.0,
        address: 'X',
        category: StoreCategory.superette,
        notificationCount: 0,
        isFavorite: false,
      ),
      Store(
        storeId: 2,
        name: 'Store 2',
        logoPath: '',
        distanceKm: 2.0,
        address: 'Y',
        category: StoreCategory.superette,
        notificationCount: 1,
        isFavorite: true,
      ),
    ];

    when(() => mockStoreRepository.getStores(toolName))
        .thenAnswer((_) async => expectedStores);

    final result = await getStoresUseCase.call(toolName);

    expect(result, expectedStores);
    verify(() => mockStoreRepository.getStores(toolName)).called(1);
  });

  test('should return a store by ID from the repository', () async {
    final storeId = 1;
    final expectedStore = Store(
      storeId: storeId,
      name: 'Store 1',
      logoPath: '',
      distanceKm: 0.0,
      address: 'X',
      category: StoreCategory.superette,
      notificationCount: 0,
      isFavorite: false,
    );

    when(() => mockStoreRepository.getStore(storeId))
        .thenAnswer((_) async => expectedStore);

    final result = await getStoresUseCase.getStoreById(storeId);
    expect(result, expectedStore);
    verify(() => mockStoreRepository.getStore(storeId)).called(1);
  });
}
