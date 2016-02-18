import QtQuick 2.0

SequentialAnimation {
    property var face

    ScriptAction {
        script: {
            face.mouth.yOffset = -10;
            face.mouth.cornerYOffset = 60;
            face.mouth.teethRotation = -40;
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
            property: "y"
            from: face.leftEye.pupil.restingY
            to: face.leftEye.pupil.restingWidth / 2
            duration: 500
            easing.type: Easing.InOutQuad
        }

    }

}
