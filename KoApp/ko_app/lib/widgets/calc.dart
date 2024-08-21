import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc({
    super.key,
    this.plusPapers,
    this.minusPapers,
    this.writePapers,
    required this.currentType,
    required this.currentPapers,
    this.onDonePressed,
    required this.controller,
    required this.focusNode,
  });
  final VoidCallback? plusPapers;
  final VoidCallback? minusPapers;
  final VoidCallback? onDonePressed;
  final Function(String)? writePapers;
  final int currentType;
  final int currentPapers;
  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  late int originalValue = 0;
  late int curPapers;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 247, 253).withOpacity(0.9),
              border: Border.all(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.currentType.toString(),
                        style: const TextStyle(
                          fontSize: 44,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'X',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        widget.currentPapers.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 44,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Text(
                        (widget.currentPapers *
                                (widget.currentType == 500
                                    ? 1
                                    : widget.currentType == 100
                                        ? 1
                                        : widget.currentType))
                            .toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 44,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: widget.controller,
                          focusNode: widget.focusNode,
                          onChanged: (value) {
                            widget.writePapers!(value);
                          },
                          onSubmitted: (value) {
                            widget.onDonePressed!();
                            widget.controller.text = '';
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            hintText: (widget.focusNode.hasFocus ||
                                    widget.controller.text.isNotEmpty)
                                ? ""
                                : "지폐 수를 입력하세요", // 포커스 시 placeholder 사라짐,
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 247, 253)
                        .withOpacity(0.9),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: widget.plusPapers,
                    icon: const Icon(Icons.add_circle_outline),
                    iconSize: 48, // 버튼 크기 조절
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 247, 253)
                        .withOpacity(0.9),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: widget.minusPapers,
                    icon: const Icon(Icons.remove_circle_outline),
                    iconSize: 48, // 버튼 크기 조절
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
