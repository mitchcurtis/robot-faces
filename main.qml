import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    color: "#3B3C3E"

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
        property alias leftEyebrow: leftEyebrow
        property alias rightEyebrow: rightEyebrow
        property alias mouth: mouth
        property alias nose: nose

        function reset() {
            face.mouth.yOffset = 0;
            face.mouth.cornerYOffset = 0;
            face.mouth.teethRotation = 0;
            face.mouth.toothHeight = face.mouth.restingToothHeight;
            face.mouth.visibleRangeMin = 0;
            face.mouth.visibleRangeMax = face.mouth.teethCount;
            face.mouth.block.visible = false;
            leftEyeBag.visible = false;
            rightEyeBag.visible = false;
        }

        Rectangle {
            id: leftEyeBag
            x: leftEye.x + leftEye.width / 2 - width / 2
            y: restingY
            width: leftEye.restingWidth - 10
            height: width
            color: "black"
            radius: width / 2
            visible: false

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
            visible: false

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

        Eyebrow {
            id: leftEyebrow
            x: leftEye.restingX + leftEye.restingWidth
            y: nose.y - height
            opacity: 1
            transformOrigin: Item.BottomLeft
        }

        Eyebrow {
            id: rightEyebrow
            x: rightEye.restingX - width
            y: nose.y - height
            opacity: 1
            // Flip image horizontally
            transform: [
                Rotation {
                    origin.x: rightEyebrow.width / 2
                    origin.y: rightEyebrow.height / 2
                    axis.z: 1
                    angle: 180
                },
                Scale {
                    origin.y: rightEyebrow.height / 2
                    yScale: -1
                }
            ]

            // Because we flip the image, we don't use BottomRight here.
            transformOrigin: Item.BottomLeft
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

    CryingAnimation {
        id: cryingAnimation
        face: face
    }

    ShyAnimation {
        id: shyAnimation
        face: face
    }

    AngryAnimation {
        id: angryAnimation
        face: face
    }

    StartledAnimation {
        id: startledAnimation
        face: face
    }

    SuspiciousAnimation {
        id: suspiciousAnimation
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
            onClicked: happyAnimation.start()
        }

        Button {
            text: "SA"
            width: 50
            onClicked: sadAnimation.start()
        }

        Button {
            text: "DI"
            width: 50
            onClicked: dizzyAnimation.start()
        }

        Button {
            text: "CR"
            width: 50
            onClicked: cryingAnimation.start()
        }

        Button {
            text: "SH"
            width: 50
            onClicked: shyAnimation.start()
        }

        Button {
            text: "AN"
            width: 50
            onClicked: angryAnimation.start()
        }

        Button {
            text: "ST"
            width: 50
            onClicked: startledAnimation.start()
        }

        Button {
            text: "SU"
            width: 50
            onClicked: suspiciousAnimation.start()
        }
    }
}
