import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "qs.power-controls"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Process {
    id: openMenuProc
    command: ["bash", "-lc", "qs ipc call shell toggle qs.menu '{\"menu\":\"system\"}'"]
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰐥"
    slotSize: Style.bar.statusSlot
    fontSize: Style.font.caption
    tooltipText: "Power controls"

    onPressed: function(mouseButton) {
      if (mouseButton === Qt.LeftButton || mouseButton === Qt.MiddleButton) {
        if (!openMenuProc.running)
          openMenuProc.running = true
      }
    }
  }
}
