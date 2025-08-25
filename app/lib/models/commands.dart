sealed class BoardCommand {}

class SetMode extends BoardCommand {
  final int mode;
  SetMode(this.mode);
}

class SetLights extends BoardCommand {
  final bool on;
  SetLights(this.on);
}

class SetLimit extends BoardCommand {
  final double amps;
  SetLimit(this.amps);
}
