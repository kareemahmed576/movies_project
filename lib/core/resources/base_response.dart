sealed class BaseResponse<T> {}

class SuccessState<T> extends BaseResponse<T>{
  T response;
  SuccessState(this.response);
}
class ErrorState<T> extends BaseResponse<T>{
  String error;
  ErrorState(this.error);
}