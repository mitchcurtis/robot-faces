import QtQuick 2.0

SequentialAnimation {
    id: blinkAnimation

    property Item grid
    property Item face

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            property: "y"
            from: grid.cellSize * 3
            to: grid.cellSize * 3.5
            duration: 100
        }
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            property: "height"
            from: face.restingEyeSize
            to: 0
            duration: 100
        }
    }

    PauseAnimation {
        duration: 50
    }

    ParallelAnimation {
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            property: "y"
            from: grid.cellSize * 3.5
            to: grid.cellSize * 3
            duration: 100
        }
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            property: "height"
            from: 0
            to: face.restingEyeSize
            duration: 100
        }
    }
}
