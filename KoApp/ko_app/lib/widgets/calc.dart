import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc({
    super.key,
    this.plusPapers,
    this.minusPapers,
    required this.currentType,
    required this.currentPapers,
  });
  final VoidCallback? plusPapers;
  final VoidCallback? minusPapers;
  final int currentType;
  final int currentPapers;

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'X',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        widget.currentPapers.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      Text(
                        (widget.currentPapers * widget.currentType).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: '장수를 입력해 주세요.',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: widget.plusPapers,
                  icon: const Icon(Icons.add_circle_outline),
                  iconSize: 48, // 버튼 크기 조절
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: widget.minusPapers,
                  icon: const Icon(Icons.remove_circle_outline),
                  iconSize: 48, // 버튼 크기 조절
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
