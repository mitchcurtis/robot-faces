import QtQuick 2.0

ParallelAnimation {
    property var face

    property int assumePupilWidth: face.leftEye.pupil.width
    property int assumePupilHeight: face.leftEye.pupil.height

    NumberAnimation {
        target: face.leftEye.pupil
        property: "x"
        from: face.leftEye.pupil.parent.width / 2 - assumePupilWidth / 2
        to: face.leftEye.pupil.restingX
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        target: face.leftEye.pupil
        property: "y"
        from: face.leftEye.pupil.parent.height / 2 - assumePupilHeight / 2
        to: face.leftEye.pupil.restingY
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        target: face.rightEye.pupil
        property: "x"
        from: face.rightEye.pupil.parent.width / 2 - assumePupilWidth / 2
        to: face.rightEye.pupil.restingX
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        target: face.rightEye.pupil
        property: "y"
        from: face.rightEye.pupil.parent.height / 2 - assumePupilHeight / 2
        to: face.rightEye.pupil.restingY
        duration: 300
        easing.type: Easing.InOutQuad
    }
}
