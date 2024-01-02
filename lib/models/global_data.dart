class GlobalData {
  static final GlobalData _instance = GlobalData._internal();

  factory GlobalData() {
    return _instance;
  }

  GlobalData._internal();

  String appDocDir = "";
  List<int> downloadedFiles = [];
  String remoteUri = "https://abdxzi.github.io/nt";
}
