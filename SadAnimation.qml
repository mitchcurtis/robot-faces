import QtQuick 2.0

SequentialAnimation {
    id: laughAnimation

    property Item grid
    property Item face

    readonly property real eyebrowMovement: face.leftEyebrow.width / 2
    readonly property real eyebrowRotation: 45

    ParallelAnimation {
        NumberAnimation {
            target: face.leftEyebrow
            property: "x"
            from: face.leftEyebrow.restingX
            to: face.leftEyebrow.restingX - eyebrowMovement
            duration: 400
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEyebrow
            property: "rotation"
            from: 0
            to: -eyebrowRotation
            duration: 400
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "x"
            from: face.rightEyebrow.restingX
            to: face.rightEyebrow.restingX + eyebrowMovement
            duration: 400
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "rotation"
            from: 0
            to: eyebrowRotation
            duration: 400
            easing.type: Easing.InOutQuad
        }
    }
    PauseAnimation {
        duration: 1000
    }
    ParallelAnimation {
        NumberAnimation {
            target: face.leftEyebrow
            property: "x"
            from: face.leftEyebrow.restingX - eyebrowMovement
            to: face.leftEyebrow.restingX
            duration: 400
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEyebrow
            property: "rotation"
            from: -eyebrowRotation
            to: 0
            duration: 400
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "x"
            from: face.rightEyebrow.restingX + eyebrowMovement
            to: face.rightEyebrow.restingX
            duration: 400
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "rotation"
            from: eyebrowRotation
            to: 0
            duration: 400
            easing.type: Easing.InOutQuad
        }
    }
}
