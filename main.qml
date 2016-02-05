import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    color: "#222"

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    Item {
        id: face
        width: parent.width
        height: parent.height

        property alias leftEye: leftEye
        property alias rightEye: rightEye
//        property alias mouth: mouth

        Eye {
            id: leftEye

            restingX: 95
            restingY: 85

            followX: followSwitch.checked ? mouseArea.mouseX : 0
            followY: followSwitch.checked ? mouseArea.mouseY : 0
        }

        Eye {
            id: rightEye

            restingX: 380
            restingY: 85

            followX: followSwitch.checked ? mouseArea.mouseX : 0
            followY: followSwitch.checked ? mouseArea.mouseY : 0
        }

        Nose {
            x: 278
            y: 200
        }

        Mouth {
            id: mouth

            x: 135
            y: 355
        }
    }


    Column {
        MouseArea {
            id: mouseArea
            width: 80
            height: 80
            hoverEnabled: true

            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: followSwitch.checked ? (mouseArea.containsMouse ? "darkorange" : "lightgrey") : "grey"
            }
        }

        Switch {
            id: followSwitch
            text: "follow eyes"

            Component.onCompleted: label.color = "white"
        }
    }
}
