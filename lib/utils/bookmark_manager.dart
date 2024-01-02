import 'dart:io';
// import 'package:neet_app/helper/helper.dart';
import 'package:neet_app/models/global_data.dart';

class BookmarkManager {
  late String _csvFilePath;
  Map<String, List<int>> _bookmarks = {};

  BookmarkManager() {
    _csvFilePath = "${GlobalData().appDocDir}/bookmark.csv";
  }

  Future<void> loadBookmarks() async {
    final file = File(_csvFilePath);

    if (await file.exists()) {
      final lines = await file.readAsLines();
      _bookmarks = {};
      for (final line in lines) {
        final parts = line.split(',');
        final pdfId = parts[0];
        final bookmarkedPages = parts[1].split('.').map((page) => int.parse(page)).toList();
        _bookmarks[pdfId] = bookmarkedPages;
      }
    } else {
      // If the file doesn't exist, create an empty file.
      await file.create();

      // Initialize _bookmarks as an empty map.
      _bookmarks = {};
    }
  }

  Map<String, List<int>> get bookmarks => _bookmarks;

  List<int> getBookmarks(String pdfId) {
    return _bookmarks[pdfId] ?? [];
  }

  Future<void> addPage(String pdfId, int pageNo) async {
    
    // if no page in file add it
    if(!_bookmarks.containsKey(pdfId)){
      _bookmarks[pdfId] = [];
    }

    if(!_bookmarks[pdfId]!.contains(pageNo)) {
      _bookmarks[pdfId]!.add(pageNo);
    }
    await _saveBookmarksToFile();
  }

  Future<void> removePage(String pdfId, int pageNo) async {
    
    if(_bookmarks[pdfId]!.contains(pageNo)) {
      _bookmarks[pdfId]!.remove(pageNo);
    }

    await _saveBookmarksToFile();
  }

  Future<void> deleteBookmark(String pdfId) async {
    _bookmarks.remove(pdfId);
    await _saveBookmarksToFile();
  }

  Future<void> _saveBookmarksToFile() async {
    final file = File(_csvFilePath);
    final lines = _bookmarks.entries.map((entry) {
      final pdfId = entry.key;
      final bookmarkedPages = entry.value.join('.');
      return '$pdfId,$bookmarkedPages';
    });
    await file.writeAsString(lines.join('\n'));
  }
}
