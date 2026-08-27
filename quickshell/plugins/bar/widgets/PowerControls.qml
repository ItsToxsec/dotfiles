import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy.power-controls"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  function openPowerMenu() {
    // Open the existing Omarchy system menu through the running shell.
    // This keeps all power actions in one place and avoids spawning another
    // Quickshell process.
    Util.execArgv(["qs", "ipc", "call", "shell", "toggle", "omarchy.menu", '{"menu":"system"}'])
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
      if (mouseButton === Qt.LeftButton || mouseButton === Qt.MiddleButton)
        root.openPowerMenu()
    }
  }
}
