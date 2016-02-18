import QtQuick 2.0

SequentialAnimation {
    id: root

    property var face

    ParallelAnimation {
        NumberAnimation {
            targets: face.rightEye.pupil
            property: "x"
            from: face.rightEye.pupil.restingX
            to: face.rightEye.pupil.restingX + 40
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.restingY
            to: face.rightEye.pupil.parent.height / 2 - face.rightEye.pupil.restingWidth / 2
            duration: 300
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
            to: face.leftEye.pupil.restingX + 10
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "y"
            from: face.leftEye.pupil.restingY
            to: 0
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

}
