import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SateliteInfoPiece<T> extends StatelessWidget {
  final String _title;
  final T _data;
  final String _unit;
  final Widget _icon;
  final Color _borderColor;
  final Color _textColor;

  const SateliteInfoPiece({
    super.key,
    Color? textColor,
    required String title,
    required T data,
    required String unit,
    required Widget icon,
    required Color borderColor,
    List<Widget>? children,
  })  : _title = title,
        _data = data,
        _unit = unit,
        _icon = icon,
        _borderColor = borderColor,
        _textColor = textColor ?? Colors.black;

  Widget _toText(dynamic data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${data is double && data is! int ? data.toStringAsFixed(2) : data}",
          style: TextStyle(
            color: _textColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6),
          child: Text(
            _unit,
            style: TextStyle(color: _textColor, fontSize: 20),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _borderColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 3),
            blurRadius: 2,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: _icon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: TextStyle(
                      color: _textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  switch (_data) {
                    (List dataList) => FlutterCarousel(
                        options: CarouselOptions(
                          height: 70,
                          scrollDirection: Axis.vertical,
                          showIndicator: true,
                          slideIndicator: CircularWaveSlideIndicator(
                            alignment: Alignment.bottomLeft,
                            indicatorRadius: 3,
                            indicatorBorderColor: _textColor,
                            currentIndicatorColor: _textColor,
                          ),
                        ),
                        items: dataList.map(_toText).toList(),
                      ),
                    _ => _toText(_data),
                  }
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
