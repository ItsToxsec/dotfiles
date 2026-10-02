import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

Item {
  WaybarBox {
    id: waybarBox
    anchors.fill: parent
    anchors.leftMargin: 3
    anchors.rightMargin: 3
    anchors.topMargin: 2
    anchors.bottomMargin: 2
    z: -1
  }

  id: root
  required property var bar
  property bool vertical: false
  property string valueText: "--"

  implicitWidth: root.vertical ? 30 : content.implicitWidth + 8
  implicitHeight: 30

  Process {
    id: proc
    command: ["sh", "-c", "for p in /sys/class/drm/card*/device/gpu_busy_percent; do [ -r \"$p\" ] && { printf '%s%%\\n' \"$(cat \"$p\")\"; exit; }; done; printf -- '--'"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        var out = String(text || "").trim()
        root.valueText = out === "" ? "--" : out
      }
    }
  }

  Timer {
    interval: 3000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: if (!proc.running) proc.running = true
  }

  Row {
    id: content
    anchors.centerIn: parent
    spacing: 4

    Text {
      text: "\udb83\udfb2"
      color: root.bar.foreground
      font.family: root.bar.fontFamily
      font.pixelSize: 14
      anchors.verticalCenter: parent.verticalCenter
    }

    Text {
      visible: !root.vertical
      text: root.valueText
      color: root.bar.foreground
      font.family: root.bar.fontFamily
      font.pixelSize: 14
      anchors.verticalCenter: parent.verticalCenter
    }
  }
}
