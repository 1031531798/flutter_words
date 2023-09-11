import 'package:flutter/cupertino.dart';

class TranslateBlock extends StatefulWidget {
  Map<String, dynamic> translateData;
  TranslateBlock({super.key, required this.translateData});

  @override
  State<TranslateBlock> createState() {
    return _TranslateBlock();
  }
}

class _TranslateBlock extends State<TranslateBlock> {
  @override
  Widget build(BuildContext context) {
    String mean = widget.translateData['mean_cn'] ?? '未知';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('释义', style: TextStyle(fontWeight: FontWeight.bold),),
        Text(mean),
      ],
    );
  }
}