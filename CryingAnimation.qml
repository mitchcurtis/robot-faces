import QtQuick 2.0

SequentialAnimation {
    id: root

    property var face

    readonly property int smallTearMovement: 2

    ScriptAction {
        script: {
            face.mouth.visibleRangeMin = 0;
            face.mouth.visibleRangeMax = face.mouth.teethCount;
        }
    }

    ParallelAnimation {
        MovePupilsToCenterAnimation {
            face: root.face
        }
        ColorAnimation {
            targets: [face.leftEye.sclera, face.rightEye.sclera]
            property: "color"
            from: "white"
            to: "black"
            duration: 300
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: [face.leftEye.sclera.border, face.rightEye.sclera.border]
            property: "width"
            from: 0
            to: 4
            duration: 300
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "color"
            from: "black"
            to: "white"
            duration: 300
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: [face.leftEye.smallTear, face.leftEye.bigTear, face.rightEye.smallTear, face.rightEye.bigTear]
            property: "opacity"
            from: 0
            to: 1
            duration: 800
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.mouth
            property: "toothHeight"
            from: face.mouth.restingToothHeight
            to: face.mouth.restingToothHeight / 3
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    SequentialAnimation {
        loops: 5

        ParallelAnimation {
            NumberAnimation {
                targets: [face.leftEye.smallTear, face.rightEye.smallTear]
                property: "x"
                from: face.leftEye.smallTear.restingX
                to: face.leftEye.smallTear.restingX + smallTearMovement
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                targets: [face.leftEye.bigTear, face.rightEye.bigTear]
                property: "x"
                from: face.leftEye.bigTear.restingX
                to: face.leftEye.bigTear.restingX + smallTearMovement
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation {
            NumberAnimation {
                targets: [face.leftEye.smallTear, face.rightEye.smallTear]
                property: "x"
                from: face.leftEye.smallTear.restingX + smallTearMovement
                to: face.leftEye.smallTear.restingX - smallTearMovement
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                targets: [face.leftEye.bigTear, face.rightEye.bigTear]
                property: "x"
                from: face.leftEye.bigTear.restingX + smallTearMovement
                to: face.leftEye.bigTear.restingX - smallTearMovement
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation {
            NumberAnimation {
                targets: [face.leftEye.smallTear, face.rightEye.smallTear]
                property: "x"
                from: face.leftEye.smallTear.restingX - smallTearMovement
                to: face.leftEye.smallTear.restingX
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                targets: [face.leftEye.bigTear, face.rightEye.bigTear]
                property: "x"
                from: face.leftEye.bigTear.restingX - smallTearMovement
                to: face.leftEye.bigTear.restingX
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
    }

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
