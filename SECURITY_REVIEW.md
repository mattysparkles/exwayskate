# Preliminary Security & Bug Review

The repository was scanned for obvious issues. Highlights:

- `ExwayProfile.sendSecurityCommand` (`app/lib/ble/exway_profile.dart`) prints raw security command payloads when the vendor service is missing. Logging sensitive data could expose secrets in production.
- `ExwayProfile.sendLightingCommand` (`app/lib/ble/exway_profile.dart`) falls back to printing command JSON when lighting service is absent. This is harmless but should be guarded or removed in release builds.
- Sample plugins (`app/lib/plugins/sample_led_breathe.dart`, `app/lib/plugins/sample_telemetry_scaler.dart`) use `print` for debugging; ensure such output is removed or wrapped with logging levels before production.

No other critical issues were found in this limited pass. A deeper audit will be performed in a follow-up session.
