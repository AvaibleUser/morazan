import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SateliteInfoPiece<T> extends StatelessWidget {
  final String _title;
  final T _data;
  final String _unit;
  final Widget _icon;

  const SateliteInfoPiece({
    super.key,
    Color? textColor,
    required String title,
    required T data,
    required String unit,
    required Widget icon,
    List<Widget>? children,
  })  : _title = title,
        _data = data,
        _unit = unit,
        _icon = icon;

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: scheme.primary,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _icon,
          _formatDataByType(scheme),
          Text(
            _title,
            style: TextStyle(
              color: scheme.onPrimary.withAlpha(95),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _formatDataByType(ColorScheme scheme) {
    return switch (_data) {
      (List dataList) => FlutterCarousel(
          options: CarouselOptions(
            height: 65,
            autoPlay: true,
            showIndicator: true,
            enableInfiniteScroll: true,
            slideIndicator: CircularWaveSlideIndicator(
              alignment: Alignment.bottomCenter,
              indicatorRadius: 3,
              indicatorBorderColor: scheme.surface,
              currentIndicatorColor: scheme.surface,
            ),
          ),
          items: dataList.map((data) => _formatData(data, scheme)).toList(),
        ),
      _ => _formatData(_data, scheme),
    };
  }

  Widget _formatData(dynamic data, ColorScheme scheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${data is double && data is! int ? data.toStringAsFixed(2) : data}",
          style: TextStyle(
            color: scheme.onPrimary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6, top: 20),
          child: Text(
            _unit,
            style: TextStyle(color: scheme.onPrimary, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
