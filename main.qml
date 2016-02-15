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
        updateInterval: 1000
        device: "/dev/ttyRPMSG"

        onErrorStringChanged: console.log(errorString)
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

    Column {
        // Uncomment this line to hide the testing buttons.
//        visible: false

        Button {
            text: "HA"
            width: 50
            onClicked: happyAnimation.start()
        }

        Button {
            text: "SA"
            width: 50
            onClicked: sadAnimation.start()
        }

        Button {
            text: "DI"
            width: 50
            onClicked: dizzyAnimation.start()
        }

        Button {
            text: "CR"
            width: 50
            onClicked: cryingAnimation.start()
        }

        Button {
            text: "AN"
            width: 50
            onClicked: angryAnimation.start()
        }

        Button {
            text: "ST"
            width: 50
            onClicked: startledAnimation.start()
        }

        Button {
            text: "SU"
            width: 50
            onClicked: suspiciousAnimation.start()
        }

        Button {
            text: "BO"
            width: 50
            onClicked: boredAnimation.start()
        }
    }
}
