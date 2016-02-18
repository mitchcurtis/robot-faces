import QtQuick 2.0

SequentialAnimation {
    id: root

    property var face

    ParallelAnimation {
        MovePupilsFromCenterAnimation {
            face: root.face
        }
        ColorAnimation {
            targets: [face.leftEye.border, face.rightEye.border, face.nose]
            property: "color"
            from: "white"
            to: face.leftEye.restingBorderColor
            duration: 400
        }
        ScriptAction {
            script: {
                face.mouth.visibleRangeMin = face.mouth.restingVisibleRangeMin;
                face.mouth.visibleRangeMax = face.mouth.restingVisibleRangeMax;
                face.mouth.block.visible = false;
            }
        }
    }

    ScriptAction {
        script: face.reset()
    }
}
