import QtQuick 2.0

SequentialAnimation {
    property var face
    readonly property int pupilXMovement: 20
    readonly property int pupilYMovement: 25
    readonly property int eyebrowStartY: face.leftEye.y - face.leftEyebrow.width * 2

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
            from: face.leftEye.pupil.restingY - pupilYMovement
            to: face.leftEye.pupil.restingY
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
