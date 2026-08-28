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
    command: ["sh", "-c", "awk '/^cpu /{u=$2+$4; t=$2+$4+$5; if (pu!=\"\"){printf \"%d%%\\n\", (u-pu)*100/(t-pt)} pu=u; pt=t}' /proc/stat; sleep 0.25; awk '/^cpu /{u=$2+$4; t=$2+$4+$5; printf \"%d%%\\n\", (u-pu)*100/(t-pt)}' pu=0 pt=0 /proc/stat"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        var out = String(text || "").trim()
        root.valueText = out === "" ? "--" : out
      }
    }
  }

  Timer {
    interval: 2000
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
      text: "\uf4bc"
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
