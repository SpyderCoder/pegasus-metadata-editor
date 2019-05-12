import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.0


ApplicationWindow {
    id: root

    title: qsTr("Pegasus Metadata Editor")
    width: 1024
    height: 600

    visible: true
    color: "#f0f3f7"


    Component.onCompleted: {
        x = Screen.width / 2 - width / 2;
        y = Screen.height / 2 - height / 2;
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }
    Shortcut {
        sequence: "Alt-F4"
        onActivated: Qt.quit()
    }


    readonly property real leftColumnWidth: width * 0.33


    header: ToolBar {
        Row {
            anchors.fill: parent

            ToolButton {
                icon.source: "qrc:///icons/fa/folder-open.svg"
                onClicked: filepicker.open()
            }
        }
    }


    RowLayout {
        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            readonly property int mWidth: leftColumnWidth - 2 * spacing

            Layout.fillHeight: true
            Layout.minimumWidth: mWidth
            Layout.maximumWidth: mWidth
            Layout.preferredWidth: mWidth
            Layout.margins: spacing
            spacing: 16


            ModelBox {
                title: "Collections"
                model: 100
                Layout.preferredHeight: root.height * 0.25
            }

            ModelBox {
                title: "Games"
                model: 100
                Layout.fillHeight: true
            }
        }

        CollectionEditor { }

        //GameEditor {}
    }

    FilePicker {
        id: filepicker
        onPick: console.log(path)
    }
}