import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

import App 1.0

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    color: "#353637"

    SegBot {
        id: segbot
        updateInterval: 100
        device: "/dev/ttyRPMSG"

        // Change this value to set the low power threshold for the warning
        readonly property int lowVoltageThreshold: 1000

        onErrorStringChanged: console.log(errorString)

        onValuesUpdated: {
            //This gets called anytime the robot state changes
            //Check if we are moving forward or backwards

            if (segbot.speedLeft > 10 && segbot.speedRight > 10) {
                //Moving forward == happy
                face.setEmotion("Happy");
                return;
            } else if ( segbot.speedLeft < -10 && segbot.speedRight < -10) {
                //Moving backwards == Sad
                face.setEmotion("Sad");
                return;
            }

        }

        onAngleChanged: {
            if ((angle > -8) && (angle < -6) || (angle > -2) && angle < 0) {
                //Small push
                face.setEmotion("Startled");
            } else if ( (angle < -8) || (angle > 0)) {
                //Big push
                face.setEmotion("Angry");
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

    Text {
        id: lowpowerWarning
        visible: false
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: "low power"
        color: "white"
    }

    Timer {
        id: idleTimer
        interval: 5000
        running: true
        repeat: true

        onTriggered: {
            //If we are in idle state, random chance to change emotion
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
}
