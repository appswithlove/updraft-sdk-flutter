class UpdraftSettings {
  String sdkKey;
  String appKey;
  String? baseUrl;

  /// Only works on Android platform
  bool showFeedbackAlert;

  UpdraftSettings(this.sdkKey, this.appKey, {this.baseUrl, this.showFeedbackAlert = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "sdkKey": sdkKey,
      "appKey": appKey,
      "baseUrl": baseUrl,
      "showFeedbackAlert": showFeedbackAlert,
    };
  }
}
