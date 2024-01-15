enum RepositoryError {
  create, fetch, update, delete;

  String get description {
    switch (this) {
      case RepositoryError.create:
        return 'fail to create';
      case RepositoryError.fetch:
        return 'fail to fetch';
      case RepositoryError.update:
        return 'fail to update';
      case RepositoryError.delete:
        return 'fail to delete';
      default:
        return 'UnCatchable Error';
    }
  }
}