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
//            model: cellsWide * cellsHigh
//            delegate: Rectangle {
//                color: "transparent"
//                border.color: "#444"
//                x: (index % cellsWide) * cellSize
//                y: Math.floor(index / cellsWide) * cellSize
//                width: cellSize
//                height: cellSize
//            }
//        }

        Item {
            id: face
            width: parent.width
            height: parent.height

//            Rectangle {
//                anchors.fill: parent
//                color: "transparent"
//                border.color: "darkorange"
//            }

            readonly property int irisSize: grid.cellSize / 2
            property int restingEyeSize: grid.cellSize * 0.8

            property alias leftEye: leftEye
            property alias rightEye: rightEye
            property alias mouth: mouth

            Rectangle {
                id: leftEye
                x: grid.cellSize * 2
                y: grid.cellSize * 3
                width: face.restingEyeSize
                height: face.restingEyeSize
                color: "#eee"
                clip: true

                Rectangle {
                    width: face.irisSize
                    height: face.irisSize
                    anchors.centerIn: parent
                    color: "steelblue"
                }
            }

            Rectangle {
                id: rightEye
                x: grid.cellSize * 6 - width
                y: grid.cellSize * 3
                width: face.restingEyeSize
                height: face.restingEyeSize
                color: "#eee"
                clip: true

                Rectangle {
                    width: face.irisSize
                    height: face.irisSize
                    anchors.centerIn: parent
                    color: "steelblue"
                }
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

            Rectangle {
                id: mouth
                x: grid.cellSize * 2
                y: grid.cellSize * 5
                width: grid.cellSize * 4
                height: grid.cellSize
                color: "#eee"
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
    }
}
