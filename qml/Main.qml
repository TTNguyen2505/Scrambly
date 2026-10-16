import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: Strings.appName

    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"

        Text {
            anchors.centerIn: parent
            text: Strings.welcomeTitle
            color: "white"
            font.pixelSize: 22
        }
    }
}
