sealed class RiderCommand {
  const RiderCommand();
}

class SetLevel extends RiderCommand {
  final int level;
  const SetLevel(this.level);
}

class SetTurbo extends RiderCommand {
  final bool enabled;
  const SetTurbo(this.enabled);
}

class SetLimits extends RiderCommand {
  final double topMph;
  final List<double> accelCurve;
  final List<double> decelCurve;
  const SetLimits({
    required this.topMph,
    required this.accelCurve,
    required this.decelCurve,
  });
}

sealed class LightingCommand {
  const LightingCommand();
  Map<String, dynamic> toJson();
}

class HeadlightCommand extends LightingCommand {
  final String state; // 'on', 'off', 'auto'
  const HeadlightCommand(this.state);
  @override
  Map<String, dynamic> toJson() => {
        'cmd': 'headlight',
        'state': state,
      };
}

class RearLightCommand extends LightingCommand {
  final String pattern; // 'solid_red', 'brake', 'brake_strobe'
  final int intensity; // 0-100
  const RearLightCommand(this.pattern, this.intensity);
  @override
  Map<String, dynamic> toJson() => {
        'cmd': 'rear',
        'pattern': pattern,
        'intensity': intensity,
      };
}

class Ws2811Command extends LightingCommand {
  final int channel;
  final List<int> data;
  const Ws2811Command({required this.channel, required this.data});
  @override
  Map<String, dynamic> toJson() => {
        'cmd': 'ws2811',
        'channel': channel,
        'pattern': 'custom',
        'data': data,
      };
}
