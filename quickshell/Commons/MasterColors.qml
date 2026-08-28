pragma Singleton
import QtQuick

// ================================================================
// MASTER COLOR LIST
// ================================================================
// Edit this file to recolor the NixOS Quickshell/Quickshell port.
// Components should not contain their own literal palette colors.
QtObject {
  // Core shell palette
  readonly property color foreground: "#0076ed"
  readonly property color background: "#323232"
  readonly property color surface: "#3f3f3f"
  readonly property color accent: "#0076ed"
  readonly property color urgent: "#eb4d4b"
  readonly property color muted: "#707880"

  // High-contrast overlay / QR colors
  readonly property color onScrim: "#ffffff"
  readonly property color onScrimDim: Qt.rgba(1, 1, 1, 0.55)
  readonly property color onScrimUrgent: "#ff6b6b"
  readonly property color scrimHeavy: Qt.rgba(0, 0, 0, 0.78)
  readonly property color overlayTrack: Qt.rgba(1, 1, 1, 0.14)
  readonly property color overlayMinorTick: Qt.rgba(1, 1, 1, 0.12)
  readonly property color overlayMajorTick: Qt.rgba(1, 1, 1, 0.30)
  readonly property color qrDark: "#111111"

  // Status / diagnostics
  readonly property color success: "#44ff88"
  readonly property color debugBounds: "#4488ff"
  readonly property color debugOuterBounds: "#ff4455"

  // Control fallbacks
  readonly property color sliderTrack: "#333333"
}
