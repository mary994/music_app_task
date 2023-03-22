abstract class UseCase<T, P> {
  Future<T> call({P? params});
}

/// used when we don't need to pass a parameters

abstract class NonParametersUseCase<T> {
  Future<T> call();
}
