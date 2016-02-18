import QtQuick 2.0

SequentialAnimation {
    property var face

   readonly property int yDistance: 60

    ParallelAnimation {
        NumberAnimation {
            targets: face.rightEye.pupil
            property: "y"
            from: face.rightEye.pupil.restingY - yDistance
            to: face.rightEye.pupil.restingY
            duration: 500
            easing.type: Easing.OutQuart
        }

        NumberAnimation {
            target: face.leftEyeBag
            property: "y"
            from: face.leftEyeBag.restingY + 30
            to: face.leftEyeBag.restingY
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: face.rightEyeBag
            property: "y"
            from: face.rightEyeBag.restingY + 30
            to: face.rightEyeBag.restingY
            duration: 500
            easing.type: Easing.InOutQuad
        }

        SequentialAnimation {
            PauseAnimation {
                duration: 200
            }
            ScriptAction {
                script: {
                    face.mouth.visibleRangeMin = face.mouth.restingVisibleRangeMin;
                    face.mouth.visibleRangeMax = face.mouth.restingVisibleRangeMax;
                }
            }
        }
    }

    ScriptAction {
        script: face.reset()
    }
}
