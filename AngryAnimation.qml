import QtQuick 2.0

SequentialAnimation {
    property var face

    ParallelAnimation {
        NumberAnimation {
            target: face.mouth
            property: "toothHeight"
            from: face.mouth.restingToothHeight
            to: face.mouth.restingToothHeight * 2.5
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: face.nose
            property: "color"
            from: face.nose.restingColor
            to: "red"
            duration: 200
        }
        NumberAnimation {
            target: face.leftEyebrow
            property: "rotation"
            from: 0
            to: -58
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
    }

    PauseAnimation {
        duration: 1000
    }

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
    }
}
