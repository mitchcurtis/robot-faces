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
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "rotation"
            from: 0
            // Because we flip the image, we don't use 45 here.
            to: -58
            duration: 200
            easing.type: Easing.InOutQuad
        }
        // The height of the eye changes, so we must move it down as well
        // to ensure that it's still centered vertically.
        NumberAnimation {
            targets: face.leftEye
            property: "y"
            from: face.leftEye.restingY
            to: face.leftEye.restingY + face.leftEye.restingHeight / 2
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye
            property: "height"
            from: face.leftEye.restingHeight
            to: face.leftEye.pupil.restingWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye.border
            property: "width"
            from: face.leftEye.restingBorderWidth
            to: face.leftEye.pupil.restingWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye
            property: "radius"
            from: face.leftEye.restingRadius
            to: face.leftEye.pupil.restingWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye.sclera
            property: "height"
            from: face.leftEye.sclera.restingHeight
            to: face.leftEye.pupil.restingWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX
            to: face.leftEye.pupil.restingX + face.leftEye.pupil.width
            duration: 200
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
            from: face.leftEye.pupil.restingX + face.leftEye.pupil.width
            to: face.leftEye.pupil.restingX
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye.sclera
            property: "height"
            from: face.leftEye.pupil.restingWidth
            to: face.leftEye.sclera.restingHeight
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye
            property: "radius"
            from: face.leftEye.pupil.restingWidth
            to: face.leftEye.restingRadius
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye.border
            property: "width"
            from: face.leftEye.pupil.restingWidth
            to: face.leftEye.restingBorderWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEye
            property: "height"
            from: face.leftEye.pupil.restingWidth
            to: face.leftEye.restingHeight
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: face.leftEye
            property: "y"
            from: face.leftEye.restingY + face.leftEye.restingHeight / 2
            to: face.leftEye.restingY
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "rotation"
            from: -58
            to: 0
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX + face.rightEye.pupil.width
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
