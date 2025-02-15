import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/api_error_handler.dart';

import '../../../../core/utils/result.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(
      data: result,
    );
  } catch (error) {
    return Error(
      apiErrorModel: ApiErrorHandler.handle(error),
    );
  }
}
