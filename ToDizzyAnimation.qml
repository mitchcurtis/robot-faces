import QtQuick 2.0

SequentialAnimation {
    property var face

    ScriptAction {
        script: {
            face.mouth.visibleRangeMin = 5;
            face.mouth.visibleRangeMax = 5;
            face.leftEyeBag.visible = true;
            face.rightEyeBag.visible = true;
        }
    }

    readonly property int yDistance: 60

    ParallelAnimation {
        NumberAnimation {
            target: face.leftEyeBag
            property: "y"
            from: face.leftEyeBag.restingY
            to: face.leftEyeBag.restingY + 30
            duration: 500
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: face.rightEyeBag
            property: "y"
            from: face.rightEyeBag.restingY
            to: face.rightEyeBag.restingY + 30
            duration: 500
            easing.type: Easing.InOutQuad
        }

        SequentialAnimation {
            // One of the eyes has to move first, so make it the right one.
            NumberAnimation {
                targets: face.rightEye.pupil
                property: "y"
                from: face.rightEye.pupil.restingY
                to: face.rightEye.pupil.restingY - yDistance
                duration: 300
                easing.type: Easing.InOutQuad
            }

            SequentialAnimation {
                loops: Animation.Infinite

                ParallelAnimation {
                    NumberAnimation {
                        targets: face.leftEye.pupil
                        property: "y"
                        from: face.leftEye.pupil.restingY
                        to: face.leftEye.pupil.restingY - yDistance
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        targets: face.rightEye.pupil
                        property: "y"
                        from: face.rightEye.pupil.restingY - yDistance
                        to: face.rightEye.pupil.restingY
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: face.leftEye.pupil
                        property: "y"
                        from: face.leftEye.pupil.restingY - yDistance
                        to: face.leftEye.pupil.restingY
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        targets: face.rightEye.pupil
                        property: "y"
                        from: face.rightEye.pupil.restingY
                        to: face.rightEye.pupil.restingY - yDistance
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }
            }

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
        }
    }
}
