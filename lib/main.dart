import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:text_input_black_box/2nd_text_field.dart';
import 'package:text_input_black_box/text_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 100,
                width: 100,
                child: CustomFormField(
                  textCapitalization: TextCapitalization.sentences,
                  fullwidth: false,
                  controller: _controller,
                  expands: true,
                  maxLines: null,
                  minFontSize: 1,
                  maxFontSize: 1000,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     FittedBox(
      //       fit: BoxFit.contain,
      //       child: Container(
      //         width: 300,
      //         height: 200,
      //         color: Colors.blue,
      //         child: AutoSizeTextField(
      //           minFontSize: 1,
      //           maxFontSize: 100,
      //           controller: TextEditingController(),
      //           style: TextStyle(),
      //           maxLines: null,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class AutoSizeTextFieldExample extends StatefulWidget {
  @override
  _AutoSizeTextFieldExampleState createState() =>
      _AutoSizeTextFieldExampleState();
}

class _AutoSizeTextFieldExampleState extends State<AutoSizeTextFieldExample> {
  TextEditingController _textEditingController = TextEditingController();
  double _fontSize = 24.0; // Initial font size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto-Size Text Field"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 80,
          ),
          child: LayoutBuilder(builder: (context, size) {
            TextSpan text = new TextSpan(
              text: _textEditingController.text,
              style: TextStyle(fontSize: _fontSize),
            );

            TextPainter tp = new TextPainter(
              text: text,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
            );
            tp.layout(maxWidth: size.maxWidth);

            int lines = (tp.size.height / tp.preferredLineHeight).ceil();
            int maxLines = 10;

            // return Scrollable(viewportBuilder: (context, position) {
            //     return _Editable
            // },);
            return SizedBox.fromSize();
          }),
        ),
      ),
    );
  }
}

class CustomTextField extends TextField {
  const CustomTextField({super.key});

  // @override
  // String? get initialValue => 'Hello World';

  // @override
  // FormFieldBuilder<String> get builder => (_) {
  //       return Container(
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           color: Colors.grey[200],
  //         ),
  //         child: AutoSizeText(
  //           _.value!,
  //           style: const TextStyle(
  //             fontSize: 24,
  //             color: Colors.black,
  //           ),
  //           maxLines: 10,
  //         ),
  //       );
  //     };
}
