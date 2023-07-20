import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 1800
    height: 400
    title: qsTr("模拟钢琴")

    Row {
        PianoComponent {
            level: 1
            onCustomClicked: {
                PianoManager.playPianoSound(message)
            }
        }
        PianoComponent {
            level: 2
            onCustomClicked: {
                PianoManager.playPianoSound(message)
            }
        }
        PianoComponent {
            level: 3
            onCustomClicked: {
                PianoManager.playPianoSound(message)
            }
        }
        PianoComponent {
            level: 4
            onCustomClicked: {
                PianoManager.playPianoSound(message)
            }
        }
        PianoComponent {
            level: 5
            onCustomClicked: {
                PianoManager.playPianoSound(message)
            }
        }
        Rectangle {
            color: "white"
            width: 50
            height: 350
            border.color: "blue"
            border.width: 1
            radius: 10
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    PianoManager.playPianoSound("C7")
                    showkey.text = "C7"
                }
            }
            Text {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                color: "black"
                text: "C7"
            }
        }
    }
    Text {
        id: showkey
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 300
        font.pixelSize: 32
        text: qsTr("C")
    }
}
