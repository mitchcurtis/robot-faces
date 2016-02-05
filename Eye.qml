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
            x: followX != 0 ? followX : parent.width / 2 - width / 2
            y: followY != 0 ? followY : parent.height / 2 - height / 2
            width: 27
            height: width
            radius: width / 2
            color: "black"
        }
    }
}
