class UpdraftSettings {
  String sdkKey;
  String appKey;
  String? baseUrl;

  UpdraftSettings(this.sdkKey, this.appKey, {this.baseUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "sdkKey": sdkKey,
      "appKey": appKey,
      "baseUrl": baseUrl,
    };
  }
}
