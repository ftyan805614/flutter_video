import 'dart:convert';

class API<T> {
  final String path;
  final Map<String, dynamic>? params;
  T Function(dynamic) parse;

  /// initialize
  API(this.path, this.params, this.parse);

  Map<String, dynamic> body() {
    Map<String, dynamic> body = getEncryptionParams(params ?? {});
    return body;
  }

  String jsonBody() {
    Map<String, dynamic> body = getEncryptionParams(params ?? {});
    return json.encode(body);
  }

  /// encryption params sign
  Map<String, dynamic> getEncryptionParams(Map<String, dynamic> params) {
    Map<String, dynamic> parameters = {};

    // int timestamp = DateTime.now().millisecondsSinceEpoch;
    // parameters['timestamp'] = timestamp.toString();

    // String version = appVersion;
    // parameters['version'] = version;

    if (params.isNotEmpty) {
      parameters.addAll(params);
    }

    return parameters;
  }
}
