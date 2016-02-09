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
    }

    PauseAnimation {
        duration: 1000
    }

    ParallelAnimation {
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
