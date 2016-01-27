import QtQuick 2.0

SequentialAnimation {
    id: blinkAnimation

    property Item grid
    property Item face

    readonly property int shockedEyeSize: face.restingEyeWidth * 1.25

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            property: "scale"
            from: 1
            to: 1.5
            duration: 200
        }
        NumberAnimation {
            target: face.mouth.smileRect
            property: "x"
            from: face.mouth.smileRect.restingX
            to: face.mouth.smileRect.restingX - grid.cellSize / 2
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.mouth.smileRect
            property: "width"
            from: face.mouth.smileRect.restingWidth
            to: face.mouth.smileRect.restingWidth + grid.cellSize
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    PauseAnimation {
        duration: 1000
    }

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            property: "scale"
            from: 1.5
            to: 1
            duration: 200
        }
        NumberAnimation {
            target: face.mouth.smileRect
            property: "x"
            from: face.mouth.smileRect.restingX - grid.cellSize / 2
            to: face.mouth.smileRect.restingX
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: face.mouth.smileRect
            property: "width"
            from: face.mouth.smileRect.restingWidth + grid.cellSize
            to: face.mouth.smileRect.restingWidth
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
