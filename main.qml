import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    color: "#222"

    Item {
        id: grid
        width: parent.height
        height: width
        anchors.centerIn: parent

        readonly property int cellsWide: 8
        readonly property int cellsHigh: 8
        readonly property int cellSize: grid.width / cellsWide

//        Repeater {
//            model: grid.cellsWide * grid.cellsHigh
//            delegate: Rectangle {
//                color: "transparent"
//                border.color: "#444"
//                x: (index % grid.cellsWide) * grid.cellSize
//                y: Math.floor(index / grid.cellsWide) * grid.cellSize
//                width: grid.cellSize
//                height: grid.cellSize
//            }
//        }

        Item {
            id: face
            width: parent.width
            height: parent.height

            property int restingEyebrowY: grid.cellSize * 2
            property int restingEyeY: grid.cellSize * 3
            property int restingEyeWidth: grid.cellSize * 0.6
            property int restingEyeHeight: grid.cellSize * 0.6
            property int restingMouthHeight: grid.cellSize / 2

            property alias leftEyebrow: leftEyebrow
            property alias rightEyebrow: rightEyebrow
            property alias leftEye: leftEye
            property alias rightEye: rightEye
            property alias mouth: mouth

            Rectangle {
                id: leftEyebrow
                x: restingX
                y: face.restingEyebrowY
                width: face.restingEyeWidth * 2
                height: face.restingEyeHeight / 2
                color: "#eee"

                property int restingX: leftEye.restingX + face.restingEyeWidth / 2 - width / 2
            }

            Rectangle {
                id: rightEyebrow
                x: restingX
                y: face.restingEyebrowY
                width: face.restingEyeWidth * 2
                height: face.restingEyeHeight / 2
                color: "#eee"

                property int restingX: rightEye.restingX + face.restingEyeWidth / 2 - width / 2
            }

            Rectangle {
                id: leftEye
                x: restingX
                y: face.restingEyeY
                width: face.restingEyeWidth
                height: face.restingEyeHeight
                color: "#eee"

                property int restingX: grid.cellSize * 2
            }

            Rectangle {
                id: rightEye
                x: restingX
                y: face.restingEyeY
                width: face.restingEyeWidth
                height: face.restingEyeHeight
                color: "#eee"

                property int restingX: grid.cellSize * 6 - face.restingEyeWidth
            }

            BlinkAnimation {
                id: blinkAnimation
                grid: grid
                face: face
            }

            ShockedAnimation {
                id: shockedAnimation
                grid: grid
                face: face
            }

            LaughAnimation {
                id: laughAnimation
                grid: grid
                face: face
            }

            SadAnimation {
                id: sadAnimation
                grid: grid
                face: face
            }

            Rectangle {
                id: mouth
                x: grid.cellSize * 2
                y: grid.cellSize * 5
                width: grid.cellSize * 4
                height: face.restingMouthHeight
                color: "#eee"

                property alias smileRect: smileRect

                Rectangle {
                    id: smileRect
                    x: restingX
                    y: parent.height
                    width: restingWidth
                    height: face.restingMouthHeight
                    color: "#eee"

                    property int restingX: grid.cellSize / 2
                    property int restingWidth: grid.cellSize * 3
                }
            }
        }
    }

    Column {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Button {
            text: "BL"
            width: grid.cellSize
            onClicked: blinkAnimation.start()
        }

        Button {
            text: "LA"
            width: grid.cellSize
            onClicked: laughAnimation.start()
        }

        Button {
            text: "SH"
            width: grid.cellSize
            onClicked: shockedAnimation.start()
        }

        Button {
            text: "SA"
            width: grid.cellSize
            onClicked: sadAnimation.start()
        }
    }
}
