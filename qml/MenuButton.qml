//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       MenuButton.qml
 * Date:           13. 11. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    QML file for menu button
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

import QtQuick 2.1
import "../javascript/theme.js" as Theme

Rectangle
{
    id: button

    property bool pressed
    property string operation

    border.color: Theme.border
    border.width: (window.height + window.width) / 600
    radius: (window.height + window.width) / 150

    pressed: false
    operation: "Inactive"

    width: window.width / 5
    height: window.height / 10
    color: pressed ? Theme.clicked_button : Theme.button

    Text
    {
        anchors.fill: parent

        font.bold: true
        font.pointSize: (window.height + window.width) / 120
        color: Theme.text

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: operation
    }

    MouseArea
    {
        anchors.fill: parent

        onPressed: button.pressed = true
        onReleased: button.pressed = false

        onClicked:
        {
            if (operation == "New Game") window.showErrorMessage ("Game is currently unplayable in this version.")

            if (operation == "Load Game") window.showErrorMessage ("Saving and loading is not implemented in this version.")

            if (operation == "Settings") showSettings ()

            if (operation == "Instructions") Qt.openUrlExternally ("http://www.indieboardsandcards.com/fpfr.php")

            if (operation == "Exit Game") window.close ()

            if (operation == "Cancel") settings.destroy ()

            if (operation == "Confirm") applySettings ()
        }
    }
}

//--------------------------------------------------------------------------------
// End of file MenuButton.qml
//--------------------------------------------------------------------------------
