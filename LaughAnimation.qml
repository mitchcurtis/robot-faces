import QtQuick 2.0

ParallelAnimation {
    id: laughAnimation

    property Item grid
    property Item face

    readonly property real eyeYDest: grid.cellSize * 3 + face.restingEyeHeight * 0.4

    // Move the whole face down.
    NumberAnimation {
        target: face
        property: "y"
        duration: 200
        from: 0
        to: face.height * 0.15
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
            // Open and close the mouth several times.
            SequentialAnimation {
                loops: 2
                
                NumberAnimation {
                    targets: face.mouth
                    property: "height"
                    from: grid.cellSize
                    to: grid.cellSize * 1.5
                    duration: 300
                }
                NumberAnimation {
                    targets: face.mouth
                    property: "height"
                    from: grid.cellSize * 1.5
                    to: grid.cellSize
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
                from: face.height * 0.15
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
        }
    }
}
