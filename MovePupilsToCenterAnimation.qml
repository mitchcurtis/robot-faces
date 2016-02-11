import QtQuick 2.0

ParallelAnimation {
    property var face

    property int assumePupilWidth: face.leftEye.pupil.width
    property int assumePupilHeight: face.leftEye.pupil.height

    NumberAnimation {
        target: face.leftEye.pupil
        property: "x"
        from: face.leftEye.pupil.restingX
        to: face.leftEye.pupil.parent.width / 2 - assumePupilWidth / 2
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        target: face.leftEye.pupil
        property: "y"
        from: face.leftEye.pupil.restingY
        to: face.leftEye.pupil.parent.height / 2 - assumePupilHeight / 2
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        target: face.rightEye.pupil
        property: "x"
        from: face.rightEye.pupil.restingX
        to: face.rightEye.pupil.parent.width / 2 - assumePupilWidth / 2
        duration: 300
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        target: face.rightEye.pupil
        property: "y"
        from: face.rightEye.pupil.restingY
        to: face.rightEye.pupil.parent.height / 2 - assumePupilHeight / 2
        duration: 300
        easing.type: Easing.InOutQuad
    }
}
