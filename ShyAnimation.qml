import QtQuick 2.0

SequentialAnimation {
    property var face

    ScriptAction {
        script: {
            face.mouth.visibleRangeMin = 4;
            face.mouth.visibleRangeMax = 6;
        }
    }

    readonly property int pupilMovement: 20

    ParallelAnimation {
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX
            to: face.leftEye.pupil.restingX + pupilMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.leftEye.pupil
            property: "y"
            from: face.leftEye.pupil.restingY
            to: face.leftEye.pupil.restingY + pupilMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX
            to: face.rightEye.pupil.restingX - pupilMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.restingY
            to: face.rightEye.pupil.restingY + pupilMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }
    }

    PauseAnimation {
        duration: 1000
    }

    ParallelAnimation {
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX + pupilMovement
            to: face.leftEye.pupil.restingX
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.leftEye.pupil
            property: "y"
            from: face.leftEye.pupil.restingY + pupilMovement
            to: face.leftEye.pupil.restingY
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX - pupilMovement
            to: face.rightEye.pupil.restingX
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.restingY + pupilMovement
            to: face.rightEye.pupil.restingY
            duration: 500
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
