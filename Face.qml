import QtQuick 2.0

Item {
    id: face

    property alias leftEyeBag: leftEyeBag
    property alias rightEyeBag: rightEyeBag
    property alias leftEye: leftEye
    property alias rightEye: rightEye
    property alias leftEyebrow: leftEyebrow
    property alias rightEyebrow: rightEyebrow
    property alias mouth: mouth
    property alias nose: nose

    function reset() {
        face.mouth.yOffset = 0;
        face.mouth.cornerYOffset = 0;
        face.mouth.teethRotation = 0;
        face.mouth.toothHeight = face.mouth.restingToothHeight;
        face.mouth.visibleRangeMin = 4;
        face.mouth.visibleRangeMax = 6;
        face.mouth.block.visible = false;
        face.leftEyeBag.visible = false;
        face.rightEyeBag.visible = false;
        face.leftEyebrow.rotation = 0;
        face.rightEyebrow.rotation = 0;
        face.leftEyebrow.y = face.leftEyebrow.restingY;
        face.rightEyebrow.y = face.rightEyebrow.restingY;
    }

    Rectangle {
        id: leftEyeBag
        x: leftEye.x + leftEye.width / 2 - width / 2
        y: restingY
        width: leftEye.restingWidth - 10
        height: width
        color: "black"
        radius: width / 2
        visible: false

        readonly property real restingY: leftEye.y + leftEye.height / 2 - height / 2
    }

    Rectangle {
        id: rightEyeBag
        x: rightEye.x + rightEye.width / 2 - width / 2
        y: restingY
        width: rightEye.restingWidth - 10
        height: width
        color: "black"
        radius: width / 2
        visible: false

        readonly property real restingY: rightEye.y + rightEye.height / 2 - height / 2
    }

    Eye {
        id: leftEye

        restingX: 95
        restingY: 85
        followX: followSwitch.checked ? mouseArea.mouseX : 0
        followY: followSwitch.checked ? mouseArea.mouseY : 0

        // QTBUG-51043
        Component.onCompleted: {
            pupil.restingX = pupil.parent.width / 2;
            pupil.restingY = pupil.parent.height / 2 + 15;
        }
    }

    Eye {
        id: rightEye

        restingX: 380
        restingY: 85
        followX: followSwitch.checked ? mouseArea.mouseX : 0
        followY: followSwitch.checked ? mouseArea.mouseY : 0

        Component.onCompleted: {
            pupil.restingX = pupil.parent.width / 2 - pupil.restingWidth;
            pupil.restingY = pupil.parent.height / 2 + 15;
        }
    }

    Eyebrow {
        id: leftEyebrow
        transformOrigin: Item.BottomLeft

        restingX: leftEye.restingX + leftEye.restingWidth
        restingY: nose.y - height
    }

    Eyebrow {
        id: rightEyebrow
        // Flip image horizontally
        transform: [
            Rotation {
                origin.x: rightEyebrow.width / 2
                origin.y: rightEyebrow.height / 2
                axis.z: 1
                angle: 180
            },
            Scale {
                origin.y: rightEyebrow.height / 2
                yScale: -1
            }
        ]
        // Because we flip the image, we don't use BottomRight here.
        transformOrigin: Item.BottomLeft

        restingX: rightEye.restingX - width
        restingY: nose.y - height
    }

    Nose {
        id: nose

        x: 278
        y: 200
    }

    Mouth {
        id: mouth

        x: 120
        y: 355
    }
}
