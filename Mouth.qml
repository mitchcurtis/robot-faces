import QtQuick 2.0

Item {
    Repeater {
        model: 11

        Rectangle {
            x: index * (width + 20)
            width: 27
            height: width
            color: "white"
        }
    }
}
