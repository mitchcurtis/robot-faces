import QtQuick 2.0

import App 1.0

Item {
    property real progress: 0
    // Affects the y position of the whole mouth
    property real yOffset: 0
    // Affects the y position of the corners of the mouth
    property real cornerYOffset: 0
    // The amount to rotate the teeth by
    property real teethRotation: 0
    // The distance from the x pos of one tooth to the x of another
    property real teethSpacing: restingTeethSpacing

    readonly property int toothWidth: 20
    readonly property int restingTeethSpacing: toothWidth + 18

    Repeater {
        id: repeater
        model: 11

        Rectangle {
            id: tooth
            x: index * teethSpacing
            y: progress * (mouthCurve.value * cornerYOffset) + progress * yOffset
            rotation: progress * normYPos * rotationDirection
            width: toothWidth
            // Make the teeth a bit taller.
            height: width + progress * 10
            color: "white"
            antialiasing: true

            // The "normalised" (0.0 - 1.0) position of this rect along the horizontal axis of the mouth.
            readonly property real normXPos: index / (repeater.count - 1)
            // The "normalised" (0.0 - 1.0) position of this rect along the vertical axis of the mouth.
            readonly property real normYPos: (normXPos < 0.5 ? 0.5 - normXPos : normXPos - 0.5) * 2
            readonly property real rotationDirection: normXPos < 0.5 ? teethRotation : -teethRotation

            // Defines the shape of the mouth.
            EasingCurve {
                id: mouthCurve
                type: Easing.InCubic
                progress: tooth.normYPos
            }
        }
    }
}
