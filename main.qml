import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

Window {
    width: 640
    height: 480
    visible: true
    color: "#222"

    readonly property int cellsWide: 8
    readonly property int cellsHigh: 8
    readonly property int cellSize: container.width / cellsWide

    Item {
        id: container
        width: parent.height
        height: width
        anchors.centerIn: parent

        Repeater {
            model: cellsWide * cellsHigh
            delegate: Rectangle {
                color: "transparent"
                border.color: "#444"
                x: (index % cellsWide) * cellSize
                y: Math.floor(index / cellsWide) * cellSize
                width: cellSize
                height: cellSize
            }
        }

        Rectangle {
            id: leftEye
            x: cellSize * 2
            y: cellSize * 3
            width: cellSize
            height: cellSize
            color: "#eee"
        }

        Rectangle {
            id: rightEye
            x: cellSize * 6 - width
            y: cellSize * 3
            width: cellSize
            height: cellSize
            color: "#eee"
        }

        SequentialAnimation {
            id: blinkAnimation

            ParallelAnimation {
                NumberAnimation {
                    targets: [leftEye, rightEye]
                    property: "y"
                    from: cellSize * 3
                    to: cellSize * 3.5
                    duration: 100
                }
                NumberAnimation {
                    targets: [leftEye, rightEye]
                    property: "height"
                    from: cellSize
                    to: 0
                    duration: 100
                }
            }

            PauseAnimation {
                duration: 50
            }

            ParallelAnimation {
                NumberAnimation {
                    targets: [leftEye, rightEye]
                    property: "y"
                    from: cellSize * 3.5
                    to: cellSize * 3
                    duration: 100
                }
                NumberAnimation {
                    targets: [leftEye, rightEye]
                    property: "height"
                    from: 0
                    to: cellSize
                    duration: 100
                }
            }
        }

        Rectangle {
            id: mouth
            x: cellSize * 2
            y: cellSize * 5
            width: cellSize * 4
            height: cellSize
            color: "#eee"
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.color: "darkorange"
        }
    }

    Column {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Button {
            text: "Blink"
            width: cellSize
            onClicked: blinkAnimation.start()
        }
    }
}
