int calculate() {
  return 6 * 7;
}
// export 'package:texteditor/Edit/';

// // import 'package:texteditor/texteditor.dart' as texteditor;

// // void main(List<String> arguments) {
// //   print('Hello world: ${texteditor.calculate()}!');
// // }
// import 'dart:io';

// extension on StringBuffer {
//   void replace(int start, int end, String replacement) {
//     final old = toString();
//     clear();
//     if (start > 0) write(old.substring(0, start));
//     write(replacement);
//     if (end < old.length) write(old.substring(end));
//   }

//   void replaceAll(String oldstr, String newstr) {
//     final oldStr = toString();
//     clear();
//     String result = oldStr.replaceAll(oldstr, newstr);
//     write(result);
//   }
// }

// void clearTerminal() {
//   if (Platform.isWindows) {
//     // Windows 系統
//     Process.runSync('cmd', ['/c', 'cls']);
//   } else {
//     // Unix-like 系統（如 macOS 和 Linux）
//     Process.runSync('clear', []);
//   }
// }

// void main() {
//   // final buffer = StringBuffer('Dart');
//   // print(buffer.length);
//   // buffer.write(' is open source');
//   // print(buffer);
//   // // buffer.replace(0, 5, 'TEST ');
//   // buffer.replaceAll("Dart", "Test");
//   // print(buffer);
//   // String? input = stdin.readLineSync();
//   // if (input == null || input.isEmpty) {
//   //   print('No input provided. Exiting the program.');
//   //   return;
//   // }
//   // print('You entered: $input');
//   List<int> array = [1, 2, 3, 4, 5];
//   array.sort((a, b) => b.compareTo(a));
//   print(array);
// }

// import 'dart:io';

// const String arrowChar = ' \x1b[1;32m←\x1b[0m ';
// const String cursorUpChar = '\x1b[A';
// const String cursorDownChar = '\x1b[B';
// const String cursorLeftChar = '\x1b[D';
// const String cursorRightChar = '\x1b[C';
// // 从当前光标的位置删至行的末尾
// const String deleteOneChar = '\x1b[0K';
// void cursorUp() => print(cursorUpChar);
// void cursorDown() => print(cursorDownChar);
// void cursorLeft() => print(cursorLeftChar);
// void cursorRight() => print(cursorRightChar);
// void deleteOne() => print(deleteOneChar);

// int chooseIndex = 1;
// void showArrow() {
//   for (int i = 3 - chooseIndex; i > 0; i--) {
//     cursorUp();
//   }
//   print(arrowChar);
// }

// void deleteArrow() {
//   cursorLeft();
//   cursorLeft();
//   cursorLeft();
//   deleteOne();
// }

// Future<void> main(List<String> arguments) async {
//   stdin.echoMode = false;
//   stdin.lineMode = false;
//   bool csiStart = false;
//   bool escStart = false;
//   print('1.文件转换\n');
//   print('2.动态模块\n');
//   print('3.一键执行');
//   // cursorLeft();
//   showArrow();
//   // 隐藏光标，没有生效
//   print('\x1b[?25l');
//   while (true) {
//     final int input = stdin.readByteSync();
//     if (input != -1) {
//       if (csiStart) {
//         csiStart = false;
//         // print(input);
//         switch (input) {
//           case 65:
//             if (chooseIndex > 1) {
//               chooseIndex--;
//               deleteArrow();
//               cursorUp();
//               print(arrowChar);
//             }
//             // up
//             // print('press up');
//             break;
//           case 66:
//             // down
//             // print('press down');
//             if (chooseIndex < 3) {
//               chooseIndex++;
//               deleteArrow();
//               cursorDown();
//               print(arrowChar);
//             }
//             break;
//           case 68:
//             // left
//             // print('press left');
//             break;
//           case 67:
//             // right
//             // print('press right');
//             break;
//         }
//       }
//       if (escStart) {
//         escStart = false;
//         if (input == 91) {
//           csiStart = true;
//         }
//       }
//       if (input == 27) {
//         escStart = true;
//       }
//     }
//     await Future<void>.delayed(const Duration(milliseconds: 10));
//   }
// }

// void print(Object object) {
//   stdout.write(object);
// }

// import 'package:args/args.dart';
// import 'package:dart_console/dart_console.dart';

// void main() {
//   final console = Console();
//   console
//     ..setBackgroundColor(ConsoleColor.blue)
//     ..setForegroundColor(ConsoleColor.white)
//     ..writeLine('Simple Demo', TextAlignment.center)
//     ..resetColorAttributes()
//     ..writeLine()
//     ..writeLine('This console window has ${console.windowWidth} cols and '
//         '${console.windowHeight} rows.')
//     ..writeLine()
//     ..writeLine('This text is left aligned.', TextAlignment.left)
//     ..writeLine('This text is center aligned.', TextAlignment.center)
//     ..writeLine('This text is right aligned.', TextAlignment.right);

//   for (final color in ConsoleColor.values) {
//     console
//       ..setForegroundColor(color)
//       ..writeLine(color.toString().split('.').last);
//   }
//   console.resetColorAttributes();
// }

// void main() {
//   final console = Console();
//   print('Press any key. Press "q" to quit.');

//   Key key;
//   do {
//     key = console.readKey();
//     print('You pressed: ${key.char} with code: ${key.controlChar}');
//   } while (key.char != 'q');
// }

// import 'dart:io';
// // import 'package:args/args.dart';
// import 'package:args/command_runner.dart';

// import 'package:dart_console/dart_console.dart';

// final console = Console();
// void main(List<String> arguments) {
//   var runner = CommandRunner("dgit", "A dart implementation of distributed version control.")
//     ..argParser.addOption('file', abbr: 'f', help: '文件路徑')
//     // ..addCommand(CommitCommand())
//     // ..addCommand(StashCommand())
//     ..run(arguments);
//   // final parser = ArgParser()..addOption('file', abbr: 'f', help: '文件路徑');
//   // ArgResults argResults = parser.parse(arguments);
//   if (argResults.wasParsed('file')) {
//     String? filePath = argResults['file'];
//     print(filePath);
//     // 处理文件
//   } else {
//     print('未提供文件路径。');
//   }
//   // car file = File(path)
// }


// import 'package:args/args.dart';
// import 'package:args/command_runner.dart';

// void main(List<String> arguments) {
//   var runner = CommandRunner("my_app", "一个示例 Dart 应用程序")
//   ..
//     ..addCommand(MyCommand());

//   runner.run(arguments).catchError((error) {
//     if (error is! UsageException) throw error;
//     print(error);
//   });
// }

// class MyCommand extends Command {
//   @override
//   final name = "my_command";
//   @override
//   final description = "执行 my_command 命令";

//   MyCommand() {
//     argParser.addOption('option', abbr: 'o', help: '一个选项');
//   }

//   @override
//   void run() {
//     if (argResults != null) {
//       print("你选择了：${argResults!['option']}");
//     }
//   }
// }