import QtQuick 2.0

SequentialAnimation {
    id: blinkAnimation

    property Item grid
    property Item face

    readonly property int shockedEyeSize: face.restingEyeWidth * 1.25

    ParallelAnimation {
//        NumberAnimation {
//            targets: [face.leftEye, face.rightEye]
//            property: "y"
//            from: grid.cellSize * 3
//            to: grid.cellSize * 3 - shockedEyeSize / 2
//            duration: 100
//        }
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            properties: "width, height"
            from: face.restingEyeWidth
            to: shockedEyeSize
            duration: 100
        }
    }

    PauseAnimation {
        duration: 500
    }

    ParallelAnimation {
//        NumberAnimation {
//            targets: [face.leftEye, face.rightEye]
//            property: "y"
//            from: grid.cellSize * 3 - shockedEyeSize / 2
//            to: grid.cellSize * 3
//            duration: 100
//        }
        NumberAnimation {
            targets: [face.leftEye, face.rightEye]
            properties: "width, height"
            from: shockedEyeSize
            to: face.restingEyeWidth
            duration: 100
        }
    }
}
