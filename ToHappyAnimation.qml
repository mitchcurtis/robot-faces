import QtQuick 2.0

SequentialAnimation {
    property var face

    readonly property int pupilXMovement: face.leftEye.pupil.restingWidth / 2
    readonly property int pupilYMovement: 42

    ScriptAction {
        script: {
            face.mouth.yOffset = 10;
            face.mouth.cornerYOffset = -60;
            face.mouth.teethRotation = 40;
            face.mouth.visibleRangeMin = 0;
            face.mouth.visibleRangeMax = face.mouth.teethCount;
        }
    }

    ParallelAnimation {
        NumberAnimation {
            target: face.mouth
            property: "progress"
            from: 0
            to: 1
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            properties: "width, height"
            from: face.leftEye.pupil.restingWidth
            to: face.leftEye.pupil.restingWidth * 2
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX
            to: face.leftEye.pupil.restingX - pupilXMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.leftEye.pupil
            property: "y"
            from: face.leftEye.pupil.restingY
            to: face.leftEye.pupil.restingY - pupilYMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX
            to: face.rightEye.pupil.restingX - pupilXMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            targets: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.restingY
            to: face.rightEye.pupil.restingY - pupilYMovement
            duration: 500
            easing.type: Easing.InOutQuad
        }
    }
}
