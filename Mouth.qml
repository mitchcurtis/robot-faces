import QtQuick 2.0

import App 1.0

Item {
    property real progress: 0
    property int expressionType

    Repeater {
        id: repeater
        model: 11

        Rectangle {
            id: tooth
            x: index * (width + 18)
            y: progress * (mouthCurve.value * -60) + progress * 50
            rotation: progress * normYPos * rotationDirection
            width: 20
            // Make the teeth a bit taller.
            height: width + progress * 10
            color: "white"
            antialiasing: true

            // The "normalised" (0.0 - 1.0) position of this rect along the horizontal axis of the mouth.
            readonly property real normXPos: index / (repeater.count - 1)
            // The "normalised" (0.0 - 1.0) position of this rect along the vertical axis of the mouth.
            readonly property real normYPos: (normXPos < 0.5 ? 0.5 - normXPos : normXPos - 0.5) * 2
            readonly property real rotationDirection: normXPos < 0.5 ? 40 : -40

            // Defines the shape of the mouth.
            EasingCurve {
                id: mouthCurve
                type: Easing.InCubic
                progress: tooth.normYPos
            }
        }
    }
}
