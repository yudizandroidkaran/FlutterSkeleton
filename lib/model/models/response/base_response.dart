class BaseResponse<T> {
  late String _error;
  late T _dataJson;
  bool isError = false;

  setData(T data) {
    _dataJson = data;
  }

  get getData {
    return _dataJson;
  }

  setException(String error) {
    isError = true;
    _error = error;
  }

  get getException {
    return _error;
  }
}
