import QtQuick 2.0

Item {
    width: 350
    height: 350
    property int level: 1
    property int whiteKeyWidth: width / 7
    property int blackKeyWidth: whiteKeyWidth * 0.8
    property int whiteKeyHeight: height
    property int blackKeyHeight: height * 0.6
    signal customClicked(string message)
    Component {
        id: blackKeyRect
        Rectangle {
            property int rectWidth: blackKeyWidth
            property int rectHeight: blackKeyHeight
            property string rectValue: "C"
            property string rectText: "1"
            property bool isHighlighted: false
            color: isHighlighted ? "darkgray" :  "black"
            width: rectWidth
            height: rectHeight
            border.color: "blue"
            border.width: 1
            radius: 10
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    customClicked(rectValue+level)
                    showkey.text = rectValue+level
                }
                onEntered: {
                    isHighlighted = true;
                }
                onExited: {
                    isHighlighted = false;
                }
            }
            Text {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                color: "white"
                text: rectText
            }
        }
    }
    Component {
        id: whiteKeyRect
        Rectangle {
            property int rectWidth: whiteKeyWidth
            property int rectHeight: whiteKeyHeight
            property string rectValue: "#C"
            property string rectText: "1"
            property bool isHighlighted: false
            color: isHighlighted ? "darkgray" :  "white"
            width: rectWidth
            height: rectHeight
            border.color: "blue"
            border.width: 1
            radius: 10
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    customClicked(rectValue+level)
                    showkey.text = rectValue+level
                }
                onEntered: {
                    isHighlighted = true;
                }
                onExited: {
                    isHighlighted = false;
                }
            }
            Text {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                color: "black"
                text: rectText
            }
        }
    }
    Row {
        z:1
        Component.onCompleted: {
            var bRect1 = blackKeyRect.createObject(parent, {rectValue: "#C",rectText: "bD"})
            var bRect2 = blackKeyRect.createObject(parent, {rectValue: "#D",rectText: "bE"})
            var bRect3 = blackKeyRect.createObject(parent, {rectValue: "#F",rectText: "bG"})
            var bRect4 = blackKeyRect.createObject(parent, {rectValue: "#G",rectText: "bA"})
            var bRect5 = blackKeyRect.createObject(parent, {rectValue: "#A",rectText: "bB"})
            bRect1.x = whiteKeyWidth * 1 - 20
            bRect2.x = whiteKeyWidth * 2 - 20
            bRect3.x = whiteKeyWidth * 4 - 20
            bRect4.x = whiteKeyWidth * 5 - 20
            bRect5.x = whiteKeyWidth * 6 - 20
        }
    }
    Row {
        Component.onCompleted: {
            var wRect1 = whiteKeyRect.createObject(parent, {rectValue: "C",rectText: "C"})
            var wRect2 = whiteKeyRect.createObject(parent, {rectValue: "D",rectText: "D"})
            var wRect3 = whiteKeyRect.createObject(parent, {rectValue: "E",rectText: "E"})
            var wRect4 = whiteKeyRect.createObject(parent, {rectValue: "F",rectText: "F"})
            var wRect5 = whiteKeyRect.createObject(parent, {rectValue: "G",rectText: "G"})
            var wRect6 = whiteKeyRect.createObject(parent, {rectValue: "A",rectText: "A"})
            var wRect7 = whiteKeyRect.createObject(parent, {rectValue: "B",rectText: "B"})
            wRect1.x = whiteKeyWidth * 0
            wRect2.x = whiteKeyWidth * 1
            wRect3.x = whiteKeyWidth * 2
            wRect4.x = whiteKeyWidth * 3
            wRect5.x = whiteKeyWidth * 4
            wRect6.x = whiteKeyWidth * 5
            wRect7.x = whiteKeyWidth * 6
        }
    }
}
