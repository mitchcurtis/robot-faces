import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtGamepad 1.0
import App 1.0

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    color: "#353637"

    Gamepad {
        id: gamepad
        deviceId: GamepadManager.connectedGamepads.length > 0 ? GamepadManager.connectedGamepads[0] : -1

        onButtonUpChanged: {
            if (value) {
                face.setEmotion("Happy");
            }
        }

        onButtonDownChanged: {
            if (value) {
                face.setEmotion("Sad");
            }
        }

    }

    SegBot {
        id: segbot
        updateInterval: 100
        device: "/dev/ttyRPMSG"

        property bool isIdle: true

        // Change this value to set the low power threshold for the warning
        readonly property int lowVoltageThreshold: 1000

        onErrorStringChanged: console.log(errorString)

        onAngleChanged: {
            if ((angle > -8) && (angle < -6) || (angle > -2) && angle < 0) {
                //Small push
                isIdle = false;
                face.setEmotion("Startled");
            } else if ( (angle < -8) || (angle > 0)) {
                //Big push
                isIdle = false;
                face.setEmotion("Angry");
            } else {
                isIdle = true;
            }
        }

        onSpeedLeftChanged: {
            if (speedLeft == 0) {
                isIdle = true
            } else {
                isIdle = false;
            }
        }

        onSpeedRightChanged: {
            if (speedRight == 0) {
                isIdle = true
            } else {
                isIdle = false;
            }
        }

        onVoltageChanged: {
            // Change to the startled state when voltage is low
            if (voltage < lowVoltageThreshold) {
                lowpowerWarning.visible = true
            } else {
                lowpowerWarning.visible = false
            }
        }
    }

    Timer {
        id: idleTimer
        interval: 3000
        running: true
        repeat: true

        onTriggered: {
            //If we are in idle state, random chance to change emotion
            if (segbot.isIdle) {
                var number = Math.floor((Math.random() * 100) + 1);
                if (number < 50) {
                    face.setEmotion("Idle")
                    return;
                } else if (number < 60) {
                    face.setEmotion("Suspicious");
                    return;
                } else if (number < 80) {
                    face.setEmotion("Happy");
                    return;
                }else if (number < 100) {
                    face.setEmotion("Bored");
                    return;
                }
            }
        }
    }

    Text {
        id: lowpowerWarning
        visible: false
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: "low power"
        color: "white"
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
    Column {
        // Uncomment this line to hide the testing buttons.
        visible: false

        Button {
            text: "HA"
            width: 50
            onClicked: {
                face.setEmotion("Happy");
                //face.state = "Happy"
            }
        }

        Button {
            text: "SA"
            width: 50
            onClicked: {
                face.setEmotion("Sad");
                //face.state = "Sad"
            }
        }

        Button {
            text: "DI"
            width: 50
            onClicked: {
                face.setEmotion("Dizzy");
                //face.state = "Dizzy";

            }
        }

        Button {
            text: "CR"
            width: 50
            onClicked: {
                face.setEmotion("Crying");
                //face.state = "Crying"
            }
        }

        Button {
            text: "AN"
            width: 50
            onClicked: {
                face.setEmotion("Angry");
                //face.state = "Angry"
            }
        }

        Button {
            text: "ST"
            width: 50
            onClicked: {
                face.setEmotion("Startled");
                //face.state = "Startled"
            }
        }

        Button {
            text: "SU"
            width: 50
            onClicked: {
                face.setEmotion("Suspicious");
                //face.state = "Suspicious"
            }

        }

        Button {
            text: "BO"
            width: 50
            onClicked: {
                face.setEmotion("Bored");
                //face.state = "Bored"
            }
        }

        Button {
            text: "ID"
            width: 50
            onClicked: {
                face.setEmotion("Idle");
                //face.state = "Idle"
            }
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
        Label {
            text: "Voltage: " + segbot.voltage
            color: "white"
        }
    }

    MouseArea {
        id: gamepadArea
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        height: 50
        width: 50
        onClicked: {
            gamepadConfigure.visible = true;
        }
    }

    GamepadConfiguration {
        id: gamepadConfigure
        visible: false

        anchors.fill: parent
    }
}
