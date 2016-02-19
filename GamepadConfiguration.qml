import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtGamepad 1.0

Rectangle {
    id: gamepadConfigDialog
    color: "#353637"


    property Button checkedButton: null
    function pressButton(button)
    {
        if (checkedButton !== null && button !== checkedButton)
            checkedButton.checked = false;
        checkedButton = button
    }

    Gamepad {
        id: gamepad
        deviceId: GamepadManager.connectedGamepads.length > 0 ? GamepadManager.connectedGamepads[0] : -1
        onDeviceIdChanged: GamepadManager.setCancelConfigureButton(deviceId, GamepadManager.ButtonStart);
    }

    Connections {
        target: GamepadManager
        onButtonConfigured: pressButton(null)
        onAxisConfigured: pressButton(null)
        onConfigurationCanceled: pressButton(null)
    }

    RowLayout {
        anchors.fill: parent
        ColumnLayout {
            Button {
                text: "Exit"
                onClicked: {
                    gamepadConfigDialog.visible = false;
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("ButtonA")
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    text: gamepad.buttonA ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonA);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("ButtonB")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonB ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonB);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("ButtonX")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonX ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonX);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("ButtonY")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonY ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonY);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("ButtonStart")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonStart ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonStart);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("ButtonSelect")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonSelect ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonSelect);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button L1")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonL1 ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonL1);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button R1")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonR1 ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonR1);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button L2")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonL2 ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonL2);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button R2")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonR2 ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonR2);
                    }
                }
            }
        }
        ColumnLayout {
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("AxisLeftX")
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    text: gamepad.axisLeftX
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureAxis(gamepad.deviceId, GamepadManager.AxisLeftX);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("AxisLeftY")
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    text: gamepad.axisLeftY
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureAxis(gamepad.deviceId, GamepadManager.AxisLeftY);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("AxisRightX")
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    text: gamepad.axisRightX
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureAxis(gamepad.deviceId, GamepadManager.AxisRightX);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("AxisRightY")
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    text: gamepad.axisRightY
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureAxis(gamepad.deviceId, GamepadManager.AxisRightY);
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button L3")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonL3 ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonL3);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button R3")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonR3 ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonR3);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button Up")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonUp ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonUp);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button Down")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    text: gamepad.buttonDown ? qsTr("DOWN") : qsTr("UP")
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonDown  );
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button Left")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    Layout.fillWidth: true
                    text: gamepad.buttonLeft ? qsTr("DOWN") : qsTr("UP")
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonLeft);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button Right")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    Layout.fillWidth: true
                    text: gamepad.buttonRight ? qsTr("DOWN") : qsTr("UP")
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonRight);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button Center")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    Layout.fillWidth: true
                    text: gamepad.buttonCenter ? qsTr("DOWN") : qsTr("UP")
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonCenter);
                    }
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Text {
                    text: qsTr("Button Guide")
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    Layout.fillWidth: true
                    text: gamepad.buttonGuide ? qsTr("DOWN") : qsTr("UP")
                    horizontalAlignment: Text.AlignHCenter
                }
                Button {
                    text: qsTr("Configure")
                    checkable: true
                    enabled: !checked
                    onCheckedChanged: {
                        pressButton(this);
                        if (checked)
                            GamepadManager.configureButton(gamepad.deviceId, GamepadManager.ButtonGuide);
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
