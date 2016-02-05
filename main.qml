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
        }

        Eye {
            id: rightEye

            restingX: 380
            restingY: 85
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
}
