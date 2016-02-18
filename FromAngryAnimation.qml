import QtQuick 2.0

SequentialAnimation {
    id: root

    property var face

    readonly property int pupilWidthIncrease: face.leftEye.pupil.restingWidth

    ParallelAnimation {
        NumberAnimation {
            target: face.leftEyebrow
            property: "rotation"
            from: -58
            to: 0
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.leftEyebrow
            property: "y"
            from: face.leftEyebrow.restingY + 18
            to: face.leftEyebrow.restingY
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.rightEyebrow
            property: "y"
            from: face.rightEyebrow.restingY + 18
            to: face.rightEyebrow.restingY
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
        ColorAnimation {
            target: face.nose
            property: "color"
            from: "red"
            to: face.nose.restingColor
            duration: 200
        }
        NumberAnimation {
            target: face.mouth
            property: "toothHeight"
            from: face.mouth.restingToothHeight * 2.5
            to: face.mouth.restingToothHeight
            duration: 200
            easing.type: Easing.InOutQuad
        }
        MovePupilsFromCenterAnimation {
            face: root.face
            assumePupilHeight: face.leftEye.pupil.restingWidth + pupilWidthIncrease
        }
        NumberAnimation {
            targets: [face.leftEye.pupil, face.rightEye.pupil]
            property: "height"
            from: face.leftEye.pupil.restingWidth + pupilWidthIncrease
            to: face.leftEye.pupil.restingWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    ScriptAction {
        script: face.reset()
    }

}
