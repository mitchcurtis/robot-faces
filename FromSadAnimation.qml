import QtQuick 2.0

SequentialAnimation {
    property var face

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "y"
            from: face.leftEye.pupil.restingWidth / 2
            to: face.leftEye.pupil.restingY
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
