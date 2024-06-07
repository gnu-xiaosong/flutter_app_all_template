import 'dart:io';
import 'package:path/path.dart' as path;

List<File> getDartFilesInDirectory(String directoryName) {
  final directory = Directory(directoryName);

  if (directory.existsSync()) {
    print(directory);
    final files = directory.listSync();
    final dartFiles = files
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))
        .toList();
    return dartFiles;
  } else {
    return [];
  }
}

String readFileContent(File file) {
  return file.readAsStringSync();
}

List<String> extractClassNames(String fileContent) {
  final classPattern = RegExp(r'class\s+(\w+)\s*{');
  final matches = classPattern.allMatches(fileContent);
  final classNames = matches.map((match) => match.group(1)!).toList();
  return classNames;
}

List<List<String>> getClassNamesInDirectory(String directoryName) {
  final dartFiles = getDartFilesInDirectory(directoryName);
  final classNamesList = <List<String>>[];

  for (var file in dartFiles) {
    final content = readFileContent(file);
    final fileClassNames = extractClassNames(content);
    classNamesList.add(fileClassNames);
  }

  return classNamesList;
}

void main() {
  // 假设 "your_directory" 包含包含 User 和 Product 类的 Dart 文件
  // final path = "../database/tables";
  // 目录名
// 目录名
  final directoryName = "lib\\database\\tables";

  // 获取当前目录的绝对路径
  final currentDirectory = path.current;

  // 拼接绝对路径
  final absolutePath = path.join(currentDirectory, directoryName);

  final classNamesList = getClassNamesInDirectory(absolutePath);

  print('Class names list: $classNamesList');
}
