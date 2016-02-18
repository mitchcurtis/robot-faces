import QtQuick 2.0

SequentialAnimation {
    id: root

    property var face

    readonly property int smallTearMovement: 2

    NumberAnimation {
        targets: [face.leftEye.smallTear, face.leftEye.bigTear, face.rightEye.smallTear, face.rightEye.bigTear]
        property: "opacity"
        from: 1
        to: 0
        duration: 400
        easing.type: Easing.InOutQuad
    }

    ParallelAnimation {
        NumberAnimation {
            target: face.mouth
            property: "toothHeight"
            from: face.mouth.restingToothHeight / 3
            to: face.mouth.restingToothHeight
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "color"
            from: "white"
            to: "black"
            duration: 300
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: [face.leftEye.sclera.border, face.rightEye.sclera.border]
            property: "width"
            from: 4
            to: 0
            duration: 300
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            targets: [face.leftEye.sclera, face.rightEye.sclera]
            property: "color"
            from: "black"
            to: "white"
            duration: 300
            easing.type: Easing.InOutQuad
        }
        MovePupilsFromCenterAnimation {
            face: root.face
        }
    }

    ScriptAction {
        script: face.reset()
    }
}
