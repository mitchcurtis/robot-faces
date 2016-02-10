import QtQuick 2.0

SequentialAnimation {
    property var face

    ScriptAction {
        script: {
            face.mouth.visibleRangeMin = -1;
            face.mouth.visibleRangeMax = -1;
            face.mouth.block.visible = true;
        }
    }

    ParallelAnimation {
        ColorAnimation {
            targets: [face.leftEye.border, face.rightEye.border, face.nose]
            property: "color"
            from: face.leftEye.restingBorderColor
            to: "white"
            duration: 400
        }
    }

    PauseAnimation {
        duration: 1000
    }

    ParallelAnimation {
        ColorAnimation {
            targets: [face.leftEye.border, face.rightEye.border, face.nose]
            property: "color"
            from: "white"
            to: face.leftEye.restingBorderColor
            duration: 400
        }
    }

    ScriptAction {
        script: face.reset()
    }
}
