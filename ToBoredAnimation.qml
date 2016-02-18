import QtQuick 2.0

SequentialAnimation {
    property var face
    readonly property int pupilXMovement: 20
    readonly property int pupilYMovement: 25
    readonly property int eyebrowStartY: face.leftEye.y - face.leftEyebrow.width * 2

    ScriptAction {
        script: {
            face.mouth.visibleRangeMin = 3;
            face.mouth.visibleRangeMax = 7;
            face.leftEyebrow.rotation = -90;
            face.rightEyebrow.rotation = -90;
        }
    }

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "y"
            from: face.leftEye.pupil.restingY
            to: face.leftEye.pupil.restingY - pupilYMovement
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


}
