import QtQuick 2.0

Canvas {
    width: 85
    height: 133

    readonly property real maxX: 177.101640
    readonly property real maxY: 349.198610
    property color color: restingColor
    readonly property color restingColor: "#80c342"

    onColorChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();
        ctx.save();
        ctx.transform(1.000000, 0.000000, 0.000000, 1.000000, -175.474020, -216.3);

        ctx.beginPath();
        ctx.moveTo(216.429020, 216.195720);
        ctx.bezierCurveTo(193.071940, 216.255320, 171.811500, 284.068660, 177.366830, 317.122840);
        ctx.bezierCurveTo(180.727960, 337.126930, 196.372070, 348.812240, 216.653990, 349.184950);
        ctx.bezierCurveTo(236.927780, 349.591540, 251.918650, 338.437500, 255.489840, 318.476780);
        ctx.bezierCurveTo(261.534440, 284.671770, 240.382420, 216.132020, 216.429020, 216.195720);
        ctx.fillStyle = color;
        ctx.fill();
        ctx.restore();
    }
}
