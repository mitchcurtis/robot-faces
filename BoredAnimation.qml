import QtQuick 2.0

SequentialAnimation {
    property var face

    ScriptAction {
        script: {
            face.mouth.visibleRangeMin = 3;
            face.mouth.visibleRangeMax = 7;
            face.leftEyebrow.rotation = -90;
            face.rightEyebrow.rotation = -90;
        }
    }

    readonly property int pupilXMovement: 20
    readonly property int pupilYMovement: 10
    readonly property int eyebrowStartY: face.leftEye.y - face.leftEyebrow.width * 2

    ParallelAnimation {
        NumberAnimation {
            target: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX
            to: face.leftEye.pupil.restingX + pupilXMovement
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX
            to: face.rightEye.pupil.restingX - pupilXMovement
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "y"
            from: face.leftEye.pupil.restingY
            to: face.leftEye.pupil.restingY + pupilYMovement
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: [face.leftEyebrow, face.rightEyebrow]
            property: "y"
            from: eyebrowStartY
            to: eyebrowStartY + face.leftEye.restingHeight / 2
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    PauseAnimation {
        duration: 1000
    }

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEyebrow, face.rightEyebrow]
            property: "y"
            from: eyebrowStartY + face.leftEye.restingHeight / 2
            to: eyebrowStartY
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "y"
            from: face.leftEye.pupil.restingY + pupilYMovement
            to: face.leftEye.pupil.restingY
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX + pupilXMovement
            to: face.leftEye.pupil.restingX
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX - pupilXMovement
            to: face.rightEye.pupil.restingX
            duration: 200
            easing.type: Easing.InOutQuad
        }
        SequentialAnimation {
            PauseAnimation {
                duration: 200
            }
            ScriptAction {
                script: {
                    face.mouth.visibleRangeMin = 0;
                    face.mouth.visibleRangeMax = face.mouth.teethCount;
                }
            }
        }
    }

    ScriptAction {
        script: face.reset()
    }
}
