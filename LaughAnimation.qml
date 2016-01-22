import QtQuick 2.0

ParallelAnimation {
    id: laughAnimation

    property Item grid
    property Item face

    readonly property real eyeYDest: grid.cellSize * 3 + face.restingEyeHeight * 0.4
    readonly property real eyebrowMovement: face.leftEyebrow.width / 3
    readonly property real faceMovement: face.height * 0.1

    // Move the whole face down.
    NumberAnimation {
        target: face
        property: "y"
        duration: 200
        from: 0
        to: faceMovement
    }

    SequentialAnimation {
        ParallelAnimation {
            // Close the eyes while looping the mouth animation.
            NumberAnimation {
                targets: [face.leftEye, face.rightEye]
                property: "y"
                from: face.restingEyeY
                to: eyeYDest
                duration: 100
            }
            NumberAnimation {
                targets: [face.leftEye, face.rightEye]
                property: "height"
                from: face.restingEyeHeight
                to: face.restingEyeHeight * 0.2
                duration: 100
            }
            // Also, move the eyebrows.
            NumberAnimation {
                target: face.leftEyebrow
                property: "x"
                from: face.leftEyebrow.restingX
                to: face.leftEyebrow.restingX - eyebrowMovement
                duration: 200
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: face.rightEyebrow
                property: "x"
                from: face.rightEyebrow.restingX
                to: face.rightEyebrow.restingX + eyebrowMovement
                duration: 200
                easing.type: Easing.InOutQuad
            }
            // Open and close the mouth several times.
            SequentialAnimation {
                loops: 3
                
                NumberAnimation {
                    targets: face.mouth
                    property: "height"
                    from: face.restingMouthHeight
                    to: face.restingMouthHeight * 2.5
                    duration: 300
                }
                NumberAnimation {
                    targets: face.mouth
                    property: "height"
                    from: face.restingMouthHeight * 2.5
                    to: face.restingMouthHeight
                    duration: 50
                }
            }
        }
        // Begin moving the entire face back up, opening eyes, etc.
        PauseAnimation {
            duration: 100
        }
        ParallelAnimation {
            NumberAnimation {
                target: face
                property: "y"
                duration: 200
                from: faceMovement
                to: 0
            }
            NumberAnimation {
                targets: [face.leftEye, face.rightEye]
                property: "y"
                from: eyeYDest
                to: face.restingEyeY
                duration: 100
            }
            NumberAnimation {
                targets: [face.leftEye, face.rightEye]
                property: "height"
                from: grid.cellSize * 0.2
                to: face.restingEyeHeight
                duration: 100
            }
            NumberAnimation {
                target: face.leftEyebrow
                property: "x"
                from: face.leftEyebrow.restingX - eyebrowMovement
                to: face.leftEyebrow.restingX
                duration: 200
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: face.rightEyebrow
                property: "x"
                from: face.rightEyebrow.restingX + eyebrowMovement
                to: face.rightEyebrow.restingX
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }
}
