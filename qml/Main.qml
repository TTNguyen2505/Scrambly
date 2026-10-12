import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Qt Project")

    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"

        Text {
            anchors.centerIn: parent
            text: "Hello from Qt!"
            color: "white"
            font.pixelSize: 22
        }
    }
}
