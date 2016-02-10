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
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX
            to: face.rightEye.pupil.restingX + face.rightEye.pupil.width
            duration: 500
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "rotation"
            from: 0
            // Because we flip the image, we don't use 45 here.
            to: -45
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    PauseAnimation {
        duration: 1000
    }

    ParallelAnimation {
        NumberAnimation {
            target: face.rightEyebrow
            property: "rotation"
            from: -45
            to: 0
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX + face.rightEye.pupil.width
            to: face.rightEye.pupil.restingX
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
