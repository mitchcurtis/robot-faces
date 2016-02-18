import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

import App 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    color: "#353637"

    SegBot {
        id: segbot
        updateInterval: 100
        device: "/dev/ttyRPMSG"

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

        states: [
            State {
                name: "Idle"
            },
            State {
                name: "Happy"
            },
            State {
                name: "Sad"
            },
            State {
                name: "Crying"
            },
            State {
                name: "Startled"
            },
            State {
                name: "Dizzy"
            },
            State {
                name: "Angry"
            },
            State {
                name: "Suspicious"
            },
            State {
                name: "Bored"
            }
        ]

        transitions: [
            Transition {
                from: "Idle"
                to: "Happy"
                ToHappyAnimation {
                    face: face
                }
            },
            Transition {
                from: "Happy"
                to: "Idle"
                FromHappyAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Sad"
                ToSadAnimation {
                    face: face
                }
            },
            Transition {
                from: "Sad"
                to: "Idle"
                FromSadAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Crying"
                ToCryingAnimation {
                    face: face
                }
            },
            Transition {
                from: "Crying"
                to: "Idle"
                FromCryingAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Startled"
                ToStartledAnimation {
                    face: face
                }
            },
            Transition {
                from: "Startled"
                to: "Idle"
                FromStartledAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Dizzy"
                ToDizzyAnimation {
                    face: face
                }
            },
            Transition {
                from: "Dizzy"
                to: "Idle"
                FromDizzyAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Angry"
                ToAngryAnimation {
                    face: face
                }
            },
            Transition {
                from: "Angry"
                to: "Idle"
                FromAngryAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Suspicious"
                ToSuspiciousAnimation {
                    face: face
                }
            },
            Transition {
                from: "Suspicious"
                to: "Idle"
                FromSuspiciousAnimation {
                    face: face
                }
            },
            Transition {
                from: "Idle"
                to: "Bored"
                ToBoredAnimation {
                    face: face
                }
            },
            Transition {
                from: "Bored"
                to: "Idle"
                FromBoredAnimation {
                    face: face
                }
            }
        ]
        state: "Idle"
    }

    Column {
        // Uncomment this line to hide the testing buttons.
        visible: false

        Button {
            text: "HA"
            width: 50
            onClicked: {
                face.state = "Happy"
            }
        }

        Button {
            text: "SA"
            width: 50
            onClicked: {
                face.state = "Sad"
            }
        }

        Button {
            text: "DI"
            width: 50
            onClicked: {
                face.state = "Dizzy";

            }
        }

        Button {
            text: "CR"
            width: 50
            onClicked: {
                face.state = "Crying"
            }
        }

        Button {
            text: "AN"
            width: 50
            onClicked: {
                face.state = "Angry"
            }
        }

        Button {
            text: "ST"
            width: 50
            onClicked: {
                face.state = "Startled"
            }
        }

        Button {
            text: "SU"
            width: 50
            onClicked: {
                face.state = "Suspicious"
            }

        }

        Button {
            text: "BO"
            width: 50
            onClicked: {
                face.state = "Bored"
            }
        }

        Button {
            text: "ID"
            width: 50
            onClicked: {
                face.state = "Idle"
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
