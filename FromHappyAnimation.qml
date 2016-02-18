import QtQuick 2.0

SequentialAnimation {
    property var face

    readonly property int pupilXMovement: face.leftEye.pupil.restingWidth / 2
    readonly property int pupilYMovement: 42

    ParallelAnimation {
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX - pupilXMovement
            to: face.leftEye.pupil.restingX
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.leftEye.pupil
            property: "y"
            from: face.leftEye.pupil.restingY - pupilYMovement
            to: face.leftEye.pupil.restingY
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX - pupilXMovement
            to: face.rightEye.pupil.restingX
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.restingY - pupilYMovement
            to: face.rightEye.pupil.restingY
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            properties: "width, height"
            from: face.leftEye.pupil.restingWidth * 2
            to: face.leftEye.pupil.restingWidth
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: face.mouth
            property: "progress"
            from: 1
            to: 0
            duration: 500
            easing.type: Easing.InOutQuad
        }
    }
    ScriptAction {
        script: face.reset()
    }
}
