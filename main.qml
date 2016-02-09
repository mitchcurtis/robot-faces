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

        property alias leftEyeBag: leftEyeBag
        property alias rightEyeBag: rightEyeBag
        property alias leftEye: leftEye
        property alias rightEye: rightEye
        property alias mouth: mouth
        property alias nose: nose

        function reset() {
            face.mouth.yOffset = 0;
            face.mouth.cornerYOffset = 0;
            face.mouth.teethRotation = 0;
        }

        Rectangle {
            id: leftEyeBag
            x: leftEye.x + leftEye.width / 2 - width / 2
            y: restingY
            width: leftEye.restingWidth - 10
            height: width
            color: "black"
            radius: width / 2

            readonly property real restingY: leftEye.y + leftEye.height / 2 - height / 2
        }

        Rectangle {
            id: rightEyeBag
            x: rightEye.x + rightEye.width / 2 - width / 2
            y: restingY
            width: rightEye.restingWidth - 10
            height: width
            color: "black"
            radius: width / 2

            readonly property real restingY: rightEye.y + rightEye.height / 2 - height / 2
        }

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
            id: nose

            x: 278
            y: 200
        }

        Mouth {
            id: mouth

            x: 120
            y: 355
        }
    }

    HappyAnimation {
        id: happyAnimation
        face: face
    }

    SadAnimation {
        id: sadAnimation
        face: face
    }

    DizzyAnimation {
        id: dizzyAnimation
        face: face
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

        Button {
            text: "HA"
            width: 50
            focus: true
            onClicked: happyAnimation.start()
        }

        Button {
            text: "SA"
            width: 50
            focus: true
            onClicked: sadAnimation.start()
        }

        Button {
            text: "DI"
            width: 50
            focus: true
            onClicked: dizzyAnimation.start()
        }
    }
}
