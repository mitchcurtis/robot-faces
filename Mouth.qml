import QtQuick 2.0

Item {
    Repeater {
        model: 11

        Rectangle {
            x: index * (width + 18)
            width: 20
            height: width
            color: "white"
        }
    }
}
