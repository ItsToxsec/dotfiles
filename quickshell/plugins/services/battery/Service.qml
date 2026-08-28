import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: root

  property var shell: null
  property string qsPath: Quickshell.shellDir
  readonly property int batteryThreshold: 10
  property string pendingPowerSource: ""
  property int percentage: -1
  property bool discharging: false

  PersistentProperties {
    id: persisted
    reloadableId: Quickshell.shellDir + "/bin/qs-battery"
    property bool notifiedLowBattery: false
  }

  function readBattery() {
    if (!readProc.running) readProc.running = true
  }

  function parse(raw) {
    var lines = String(raw || "").split("\n")
    var d = {}
    for (var i = 0; i < lines.length; ++i) {
      var a = lines[i].split("=")
      if (a.length >= 2) d[a[0]] = a.slice(1).join("=").trim()
    }
    var p = parseInt(d.capacity || "-1")
    if (!isNaN(p)) percentage = p
    discharging = (d.status || "").toLowerCase() === "discharging"
    var low = discharging && percentage >= 0 && percentage <= batteryThreshold
    if (low && !persisted.notifiedLowBattery) {
      persisted.notifiedLowBattery = true
      warningProcess.command = [qsPath + "/bin/qs-battery-low", String(percentage)]
      warningProcess.running = true
    } else if (!low) {
      persisted.notifiedLowBattery = false
    }
    pendingPowerSource = discharging ? "battery" : "ac"
  }

  Process {
    id: readProc
    command: ["sh", "-c", "for f in capacity status; do printf '%s=' \"$f\"; cat /sys/class/power_supply/BAT1/$f 2>/dev/null; done"]
    stdout: StdioCollector { waitForEnd: true; onStreamFinished: root.parse(text) }
  }

  Process { id: warningProcess }


  Timer {
    interval: 30000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.readBattery()
  }
}
