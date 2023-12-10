// import 'dart:io';
// import 'package:args/command_runner.dart';
// import 'package:args/args.dart';

// Future<void> main(List<String> arguments) async {
//   var runner = CommandRunner("dte", "Derrick TextEditor")
//     ..argParser.addOption('file', abbr: 'f', help: '要读取的文件路径')
//     ..run(arguments);

//   // try {
//   // await runner.run(arguments);
//   // 默认操作
//   // var filePath = runner.argParser.parse(arguments)['file'];
//   // if (filePath == null) {
//   //   print('请提供文件路径。');
//   //   return;
//   // }

//   // var file = File(filePath);
//   // var content = await file.readAsString();
//   // print(content);
//   // } catch (error) {
//   //   if (error is! UsageException) rethrow;
//   //   // print(error);
//   // }
// }

// // import 'dart:io';
// // import 'package:args/args.dart';
// // import 'package:args/command_runner.dart';

// // void main(List<String> arguments) {
// //   var runner = CommandRunner("my_app", "一个示例 Dart 应用程序")
// //     ..argParser.addOption('file', abbr: 'f', help: '要读取的文件路径');

// //   runner.run(arguments).then((_) {
// //     // 默认操作
// //     var filePath = runner.argParser.parse(arguments)['file'];
// //     if (filePath == null) {
// //       print('请提供文件路径。');
// //       return;
// //     }

// //     var file = File(filePath);
// //     if (!file.existsSync()) {
// //       print('文件不存在: $filePath');
// //       return;
// //     }

// //     var content = file.readAsStringSync();
// //     print(content);
// //   }).catchError((error) {
// //     if (error is! UsageException) throw error;
// //     // print(error);
// //   });
// // }

// import 'dart:io';

// import 'package:args/command_runner.dart';

// void main(List<String> arguments) {
//   var runner = CommandRunner("example", "An example command-line application")
//     ..argParser.addOption('file', abbr: 'f', help: '要读取的文件路径')
//     ..addCommand(MyCommand());

//   runner.run(arguments).catchError((error) {
//     if (error is! UsageException) throw error;
//     print(error);
//     // Exit code 64 indicates a usage error.
//     exit(64);
//   });
// }

// class MyCommand extends Command {
//   @override
//   final name = "hello";
//   @override
//   final description = "Prints 'Hello world'.";

//   @override
//   void run() {
//     print("Hello world!");
//   }
// }

// import 'dart:io';
// import 'package:args/args.dart';

// void main(List<String> arguments) {
//   final parser = ArgParser()
//     ..addOption('file', abbr: 'f', help: '要读取的文件路径');

//   var argResults = parser.parse(arguments);

//   var filePath = argResults['file'];
//   if (filePath == null) {
//     print('请提供文件路径。');
//     return;
//   }

//   var file = File(filePath);
//   if (!file.existsSync()) {
//     print('文件不存在: $filePath');
//     return;
//   }

//   var content = file.readAsStringSync();
//   print(content);
// }

// import 'dart:io';
// import 'package:args/command_runner.dart';

// class CommandRunnerExtension extends CommandRunner {
//   CommandRunnerExtension(super.executableName, super.description,
//       {int? usageLineLength, super.suggestionDistanceLimit = 2});
//   @override
//   String get invocation => '$executableName <command|file> [arguments]';
// }

// void main(List<String> arguments) {
//   var runner = CommandRunnerExtension('dte', "Derrick TextEditor")
//     ..addCommand(MyCommand());

//   // 没有参数，或者参数为 `-h` 或 `--help` 时显示帮助
//   if (arguments.isEmpty ||
//       arguments.contains('-h') ||
//       arguments.contains('--help')) {
//     runner.printUsage();
//     return;
//   }

//   // 检查第一个参数是否是已定义的命令
//   if (runner.commands.containsKey(arguments[0])) {
//     runner.run(arguments).catchError((error) {
//       if (error is! UsageException) throw error;
//       print(error);
//       exit(64); // 退出代码 64 表示使用错误
//     });
//   } else {
//     // 假设第一个参数是一个文件路径
//     handleFile(arguments[0]);
//   }
// }

// void handleFile(String filePath) {
//   var file = File(filePath);
//   if (file.existsSync()) {
//     print('Handling file: $filePath');
//     // 在这里添加文件处理逻辑
//   } else {
//     print('File not found: $filePath');
//   }
// }

// class MyCommand extends Command {
//   @override
//   final name = 'my_command';
//   @override
//   final description = 'Executes my_command.';

//   @override
//   void run() {
//     // MyCommand 的逻辑
//     print('Running my_command...');
//   }
// }

// extension StringBufferExtension on StringBuffer {
//   void replaceFirstOccurrence(String from, String to) {
//     String original = toString();
//     int index = original.indexOf(from);
//     if (index < 0) return; // 沒找到指定子串，不做任何操作

//     this
//       ..clear()
//       ..write(original.substring(0, index))
//       ..write(to)
//       ..write(original.substring(index + from.length));
//   }
// }

// void main() {
//   StringBuffer buffer = StringBuffer();
//   buffer.write('Hello Dart, Dart is great!');

//   buffer.replaceFirstOccurrence('Dart', 'Flutter');
//   print(buffer); // 輸出: "Hello Flutter, Dart is great!"
// }

// import 'dart:io';

// void main() async {
//   var file = File('test.txt');
//   RandomAccessFile raf = await file.open(mode: FileMode.append);

//   // 寫入數據
//   // await raf.writeString('Hello, Dart!');

//   // 移動到文件開頭
//   await raf.setPosition(0);
//   var len = await raf.length();
//   print(len);
//   // 讀取數據
//   List<int> bytes = await raf.read(len); // 讀取前 100 個字節
//   print(String.fromCharCodes(bytes));
//   print(bytes);

//   await raf.close();
// }

import 'dart:io';
import 'dart:convert';

void main() async {
  var file = File('test.txt');
  StringBuffer buffer = StringBuffer();
  int len = await file.length();
  print(len);
  String contents = await file.readAsString(encoding: utf8);
  buffer.write(contents);

  print(buffer.toString()); // 打印文件內容
}
