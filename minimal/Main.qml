import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
	width: Screen.width
	height: Screen.height

	//variables
	readonly property string userName: config.stringValue("userName")
	property color textColor: "#ffc6c6c6"
	property color placeHolderTextColor: "#ff6d6d6d"
	property color fieldBackgroundColor: "#77000000"

	Image {
		anchors.fill: parent
		source: "background.jpg"
		fillMode: Image.PreseverAspectCrop
	}

	// clock
	Text {
		id: clockText
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		anchors.verticalCenterOffset: -300

		font.pixelSize: 130
		font.bold: true
		color: textColor

		text: Qt.formatTime(new Date(), "hh:mm")

		Timer {
			interval: 1000
			running: true
			repeat: true
			onTriggered: clockText.text = Qt.formatTime(new Date(), "hh:mm")
		}
	}

	// login box
	Rectangle {
		width: 380
		height: 220
		radius: 18
		color: "#00000000"
		anchors.centerIn: parent

		Column {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			anchors.verticalCenterOffset: 0
			spacing: 12

			// Text {
			// 	id: userNameText
			// 	horizontalAlignment: TextInput.AlignHCenter
			// 	verticalAlignment: TextInput.AlignVCenter
			// 	width: 300
			// 	height: 45
			// 	text: userName
			// 	color: textColor
			// 	font.pixelSize: 30
			// 	font.letterSpacing: 0.8
			// 	font.bold: true
			// }

			TextField {
				id: passField
				horizontalAlignment: TextInput.AlignHCenter
				verticalAlignment: TextInput.AlignVCenter
				echoMode: TextInput.Password
				width: 300
				height: 45

				color: textColor
				font.pixelSize: 16
				font.letterSpacing: 0.8

				background: Rectangle {
					radius: 10
					color: fieldBackgroundColor
				}

				// placeholder text
				Text {
					anchors.centerIn: parent
					text: "Password"
					font.pixelSize: 20
					font.bold: true
					color: placeHolderTextColor
					visible: (passField.activeFocus == 0) && (passField.text.length === 0)
				}

				onAccepted: {
					sddm.login(userName, passField.text, 0)
				}
			}
		}
	}
}
