import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.labs.controls 1.0

import App 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    color: "#353637"

    SegBot {
        id: segbot
        updateInterval: 100
        device: deviceName

        onErrorStringChanged: console.log(errorString)

        onValuesUpdated: {
            if (segbot.angle < -5) {
                startAnimation(startledAnimation);
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    Face {
        id: face
        width: parent.width
        height: parent.height
    }

    HappyAnimation {
        id: happyAnimation
        face: face
    }

    SadAnimation {
        id: sadAnimation
        face: face
    }

    DizzyAnimation {
        id: dizzyAnimation
        face: face
    }

    CryingAnimation {
        id: cryingAnimation
        face: face
    }

    AngryAnimation {
        id: angryAnimation
        face: face
    }

    StartledAnimation {
        id: startledAnimation
        face: face
    }

    SuspiciousAnimation {
        id: suspiciousAnimation
        face: face
    }

    BoredAnimation {
        id: boredAnimation
        face: face
    }

    property var currentAnimation

    function startAnimation(animation) {
        if (currentAnimation) {
            if (!currentAnimation.running) {
                currentAnimation.stopped.disconnect(onCurrentAnimationStopped);
            } else {
                return;
            }
        }

        currentAnimation = animation;
        currentAnimation.stopped.connect(onCurrentAnimationStopped);
        currentAnimation.start();
    }

    function onCurrentAnimationStopped() {
        currentAnimation = null;
    }

    Column {
        // Uncomment this line to hide the testing buttons.
        visible: false

        Button {
            text: "HA"
            width: 50
            onClicked: startAnimation(happyAnimation)
        }

        Button {
            text: "SA"
            width: 50
            onClicked: startAnimation(sadAnimation)
        }

        Button {
            text: "DI"
            width: 50
            onClicked: startAnimation(dizzyAnimation)
        }

        Button {
            text: "CR"
            width: 50
            onClicked: startAnimation(cryingAnimation)
        }

        Button {
            text: "AN"
            width: 50
            onClicked: startAnimation(angryAnimation)
        }

        Button {
            text: "ST"
            width: 50
            onClicked: startAnimation(startledAnimation)
        }

        Button {
            text: "SU"
            width: 50
            onClicked: startAnimation(suspiciousAnimation)
        }

        Button {
            text: "BO"
            width: 50
            onClicked: startAnimation(boredAnimation)
        }
    }

    Column {
        Label {
            text: "Angle: " + segbot.angle
            color: "white"
        }
        Label {
            text: "Speed left: " + segbot.speedLeft
            color: "white"
        }
        Label {
            text: "Speed right: " + segbot.speedRight
            color: "white"
        }
        Label {
            text: "Distance: " + segbot.sensorDistance
            color: "white"
        }
    }
}
