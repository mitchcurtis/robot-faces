import QtQuick 2.0

Rectangle {
    x: restingX
    y: restingY
    width: restingWidth
    height: restingHeight
    color: "transparent"
    radius: width / 2
    border.width: 12
    border.color: "#80c342"

    property alias pupil: pupil
    property int restingX
    property int restingY
    property int restingWidth: 165
    property int restingHeight: 165
    property int followX: 0
    property int followY: 0

    Rectangle {
        color: "white"
        width: 112
        height: width
        radius: width / 2
        anchors.centerIn: parent

        Rectangle {
            id: pupil
            x: followX != 0 ? followX : restingX
            y: followY != 0 ? followY : restingY
            width: 27
            height: width
            radius: width / 2
            color: "black"

            readonly property int restingX: parent.width / 2 - width / 2
            readonly property int restingY: parent.height / 2 - height / 2
        }
    }
}
