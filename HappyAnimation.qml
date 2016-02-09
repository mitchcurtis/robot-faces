import QtQuick 2.0

import App 1.0

SequentialAnimation {
    property var face

    readonly property int pupilMovement: 4

    ScriptAction {
        script: {
            face.mouth.yOffset = 50;
            face.mouth.cornerYOffset = -60;
            face.mouth.teethRotation = 40;
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
            to: face.rightEye.pupil.restingX - pupilMovement - face.rightEye.pupil.restingWidth
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
            from: face.rightEye.pupil.restingX - pupilMovement - face.rightEye.pupil.restingWidth
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
