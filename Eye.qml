import QtQuick 2.0

Rectangle {
    x: restingX
    y: restingY
    width: restingWidth
    height: restingHeight
    color: "black"
    radius: width / 2
    border.width: 12
    border.color: "#80c342"

    property alias pupil: pupil
    property alias sclera: sclera
    property alias smallTear: smallTear
    property alias bigTear: bigTear
    property int restingX
    property int restingY
    property int restingWidth: 165
    property int restingHeight: 165
    property int followX: 0
    property int followY: 0

    Rectangle {
        id: sclera
        color: "white"
        width: 112
        height: width
        radius: width / 2
        border.color: "white"
        border.width: 0
        antialiasing: true
        anchors.centerIn: parent

        Rectangle {
            id: pupil
            x: followX != 0 ? followX : restingX
            y: followY != 0 ? followY : restingY
            width: restingWidth
            height: width
            radius: width / 2
            color: "black"
            antialiasing: true

            readonly property int restingX: parent.width / 2 - restingWidth / 2
            readonly property int restingY: parent.height / 2 - restingWidth / 2
            readonly property int restingWidth: 27
        }

        Rectangle {
            id: smallTear
            x: restingX
            y: restingY
            width: 10
            height: width
            radius: width / 2
            color: "#80c342"
            opacity: 0

            property int restingX: bigTear.restingX - width + 2
            property int restingY: bigTear.y - 8
        }

        Image {
            id: bigTear
            x: restingX
            y: restingY
            source: "qrc:/images/big-tear.png"
            opacity: 0

            property int restingX: pupil.restingX
            property int restingY: pupil.restingY + pupil.restingWidth + 5
        }
    }
}
