//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       TitleScreen.qml
 * Date:           21. 10. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    QML file for title screen
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

import QtQuick 2.1
import QtQuick.Window 2.0

Window
{
    id: window
    visible: true

    width: 1280
    height: 720

    minimumWidth: 640
    minimumHeight: 360

    title: "RESCUERS - Title Screen"

    function showErrorMessage (errorMessage)
    {
        var component = Qt.createComponent ("ErrorMessage.qml")
        var messagebox = component.createObject (window)
        messagebox.message = errorMessage
    }

    Image
    {
        width: parent.width
        height: parent.height
        source: "../img/background.jpg"
    }

    Column
    {
        anchors.right: parent.right
        anchors.rightMargin: window.width / 15

        anchors.top: parent.top
        anchors.topMargin: window.height / 4

        spacing: window.height / 30

        MenuButton
        {
            operation: "New Game"
        }
        MenuButton
        {
            operation: "Load Game"
        }
        MenuButton
        {
            operation: "Settings"
        }
        MenuButton
        {
            operation: "Instructions"
        }
        MenuButton
        {
            operation: "Exit Game"
        }
    }
}

//--------------------------------------------------------------------------------
// End of file TitleScreen.qml
//--------------------------------------------------------------------------------
