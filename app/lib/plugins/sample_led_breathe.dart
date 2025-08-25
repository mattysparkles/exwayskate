import 'api.dart';

/// Demonstrates a simple plugin that exposes an LED "breathe" effect.
class SampleLedBreathePlugin implements XrayPlugin {
  @override
  String get id => 'sample_led_breathe';

  @override
  String get name => 'LED Breathe';

  @override
  Future<void> init(PluginContext ctx) async {
    ctx.addMenuItem(PluginMenuItem(
      id: id,
      title: 'LED Breathe',
      onSelected: () {
        ctx.registerCommand('led_breathe', (args) async {
          // In mock mode we simply log the command.
          // Real implementation would send lighting command with pattern=breathe.
          // ignore: avoid_print
          print('Mock: LED breathe command sent');
        });
      },
    ));
  }
}
