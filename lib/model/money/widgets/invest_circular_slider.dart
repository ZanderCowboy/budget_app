part of '../account_card.dart';

class _InvestCircularSlider extends StatelessWidget {
  const _InvestCircularSlider({
    required this.investColor,
  });

  final Color? investColor;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        animationEnabled: portfolioAnimationBool,
        infoProperties: InfoProperties(
          topLabelStyle: TextStyle(
            color: investColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          topLabelText: 'Invest',
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
          trackColor: investColor,
          progressBarColor: investColor,
          dotColor: investColor,
        ),
        customWidths: CustomSliderWidths(progressBarWidth: 10),
      ),
      initialValue: 20,
    );
  }
}
