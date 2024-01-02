import 'package:neet_app/components/theme.dart';
import 'package:neet_app/screens/chapterwise.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter App',
    theme: blackAndWhite,
    debugShowCheckedModeBanner: false,
    // home: const MyHomePage(),
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(),
      '/chapterwise': (context) => Chapterwise(),
      '/yearwise': (context) => PdfListScreen(title: 'Solved Papers - Yearwise', documents: Document.yearwise),
      '/unsolved': (context) => PdfListScreen(title: 'Unsolved Papers - Yearwise', documents: Document.unsolved),
      '/syllabus': (context) => PdfListScreen(title: 'NEET Syllabus', documents: Document.syllabus),
    },
  ));
}


// Bookmark
// Open Where left off