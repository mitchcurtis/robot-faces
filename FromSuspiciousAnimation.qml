import QtQuick 2.0

SequentialAnimation {
    id: root

    property var face

    ParallelAnimation {
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "x"
            from: face.leftEye.pupil.restingX + 10
            to: face.leftEye.pupil.restingX
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            targets: face.leftEye.pupil
            property: "y"
            from: 0
            to: face.leftEye.pupil.restingY
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
            from: face.rightEye.pupil.restingX + 40
            to: face.rightEye.pupil.restingX
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.parent.height / 2 - face.rightEye.pupil.restingWidth / 2
            to: face.rightEye.pupil.restingY
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

    ScriptAction {
        script: face.reset()
    }

}
