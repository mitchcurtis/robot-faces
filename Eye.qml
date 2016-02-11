import QtQuick 2.0

Rectangle {
    x: restingX
    y: restingY
    width: restingWidth
    height: restingHeight
    color: "black"
    radius: restingRadius
    border.width: restingBorderWidth
    border.color: restingBorderColor

    property alias pupil: pupil
    property alias sclera: sclera
    property alias smallTear: smallTear
    property alias bigTear: bigTear
    property int restingX
    property int restingY
    property int restingWidth: 165
    property int restingHeight: 165
    readonly property int restingRadius: restingWidth / 2
    property int followX: 0
    property int followY: 0

    readonly property color restingBorderColor: "#80c342"
    readonly property int restingBorderWidth: 12

    Rectangle {
        id: sclera
        color: "white"
        width: restingHeight
        height: restingHeight
        radius: width / 2
        border.color: "white"
        border.width: 0
        antialiasing: true
        anchors.centerIn: parent

        readonly property int restingHeight: 112

        Canvas {
            id: pupil
            x: followX != 0 ? followX : restingX
            y: followY != 0 ? followY : restingY
            width: restingWidth
            height: width

            property color color: "black"
            property int restingX
            property int restingY
            readonly property int restingWidth: 27

            onColorChanged: requestPaint()

            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.beginPath();
                ctx.ellipse(0, 0, width, height);
                ctx.fillStyle = color;
                ctx.fill();
            }
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
