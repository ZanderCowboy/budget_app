part of '../account_card.dart';

class _DeptCircularSlider extends StatelessWidget {
  const _DeptCircularSlider({
    required this.debtColor,
    this.minValue,
    this.maxValue,
    this.initialValue,
  });

  final Color? debtColor;
  final double? minValue;
  final double? maxValue;
  final double? initialValue;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        animationEnabled: portfolioAnimationBool,
        infoProperties: InfoProperties(
          topLabelStyle: TextStyle(
            color: debtColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          topLabelText: 'Debt',
          mainLabelStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
          modifier: (double value) {
            return 'R${value.toStringAsFixed(2)}';
          },
        ),
        customColors: CustomSliderColors(
          hideShadow: true,
          trackColor: debtColor,
          progressBarColor: debtColor,
          dotColor: debtColor,
        ),
        customWidths: CustomSliderWidths(progressBarWidth: 10),
      ),
      min: minValue ?? 0,
      max: maxValue ?? 100,
      initialValue: initialValue ?? 50,
    );
  }
}
