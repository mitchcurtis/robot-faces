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
    readonly property real teethSpacing: toothWidth + 18
    readonly property int restingToothHeight: toothWidth
    property real toothHeight: restingToothHeight

    property int visibleRangeMin: 4
    property int visibleRangeMax: 6
    readonly property alias teethCount: repeater.count

    readonly property int toothWidth: 20

    property alias block: block

    // Some manual adjustments that get very messy if calculated based on the index, etc.
    readonly property var xAdjustments: [15, 5, 0, 0, 0, 0, 0, 0, 0, -5, -15]
    readonly property var yAdjustments: [-15, -5, 0, -2, -5, -7, -5, -2, 0, -5, -15]

    Repeater {
        id: repeater
        model: 11

        Rectangle {
            id: tooth
            x: index * teethSpacing + xAdjustment
            y: progress * (mouthCurve.value * cornerYOffset) + progress * yOffset + yAdjustment
            rotation: progress * normYPos * rotationDirection
            scale: Math.min(0.5 + (1 - (progress * normYPos)), 1)
            width: toothWidth
            // Make the teeth a bit taller.
            height: toothHeight + progress * 10
            color: "#929495"
            antialiasing: true
            visible: index >= visibleRangeMin && index <= visibleRangeMax

            // The "normalised" (0.0 - 1.0) position of this rect along the horizontal axis of the mouth.
            readonly property real normXPos: index / (repeater.count - 1)
            // The "normalised" (0.0 - 1.0) position of this rect along the vertical axis of the mouth.
            readonly property real normYPos: (normXPos < 0.5 ? 0.5 - normXPos : normXPos - 0.5) * 2
            readonly property real rotationDirection: normXPos < 0.5 ? teethRotation : -teethRotation
            // Push the teeth at the edge of the mouth towards the center, as they're too spaced out by default.
            readonly property real xAdjustment: progress * xAdjustments[index]
            readonly property real yAdjustment: progress * (cornerYOffset > 0 ? yAdjustments[index] : Math.abs(yAdjustments[index]))

            // Defines the shape of the mouth.
            EasingCurve {
                id: mouthCurve
                type: Easing.InCubic
                progress: tooth.normYPos
            }
        }
    }

    Rectangle {
        id: block
        x: 320 - parent.x - width / 2
        width: 85
        height: restingToothHeight
        color: "#929495"
        visible: false
    }
}
