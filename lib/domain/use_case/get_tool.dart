part of my_domain;

 final class GetToolsUseCase {
  final ToolRepository toolRepository;

  const GetToolsUseCase({required this.toolRepository});

  Future<List<Tool>> call() => toolRepository.getTools();
}