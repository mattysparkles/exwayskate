double thermalHeadroom(double escTemp, double motorTemp) {
  const maxTemp = 100.0;
  final worst = escTemp > motorTemp ? escTemp : motorTemp;
  return ((maxTemp - worst) / maxTemp).clamp(0, 1);
}

double voltageSag(double nominal, double current) {
  return (nominal - current * 0.05).clamp(0, nominal);
}
