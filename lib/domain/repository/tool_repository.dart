part of my_domain;

abstract class ToolRepository {
  const ToolRepository();

  Future<List<Tool>> getTools();
}