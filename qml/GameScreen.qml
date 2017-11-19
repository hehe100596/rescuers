//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       GameScreen.qml
 * Date:           19. 11. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    QML file for game screen
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

import QtQuick 2.1
import QtQuick.Window 2.0
import "../javascript/theme.js" as Theme

Window
{
    id: game

    visible: true
    modality: Qt.ApplicationModal

    property int difficulty
    property int players
    property int building
    property bool timer
    property var clock

    width: window.width
    height: window.height

    minimumWidth: 640
    minimumHeight: 360

    difficulty: window.difficulty === "Easy" ? 0 : window.difficulty === "Medium" ? 1 : 2
    players: parseInt (window.players)
    building: window.building === "1st Edition" ? 0 : 1
    timer: window.timer === "OFF" ? false : true
    clock: new Date (0, 0, 0, 0, 0, 0)

    title: "RESCUERS - Game Screen"

    function actualizeTimer (actual_time, seconds)
    {
        actual_time.setSeconds (actual_time.getSeconds () + seconds)
        return actual_time
    }

    function pauseGame ()
    {
        if (timer.running)
        {
            timer.stop ()
            pause_button.button_text = "Resume Game"
        }
        else
        {
            timer.start ()
            pause_button.button_text = "Pause Game"
        }
    }

    Image
    {
        width: parent.width / 1.3
        height: parent.height
        source: game.building === 0 ? "../img/1st_edition_gameboard.jpg" : "../img/2nd_edition_gameboard.jpg"
    }

    Component.onCompleted:
    {
        setX (Screen.width / 2 - width / 2)
        setY (Screen.height / 2 - height / 2)
    }

    Timer
    {
        id: timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: game.clock = actualizeTimer (game.clock, 1)
    }

    Row
    {
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 30

        anchors.top: parent.top
        anchors.topMargin: parent.height / 20

        Column
        {
            spacing: game.height / 30

            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter

                font.bold: true
                font.pointSize: (game.height + game.width) / 120
                color: game.timer ? Theme.combo_box : Theme.button

                text: (game.clock).toLocaleTimeString ()
            }

            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter

                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Number of players - " + window.players
            }

            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter

                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Difficulty - " + window.difficulty
            }
        }
    }

    Row
    {
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 30

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 20

        Column
        {
            spacing: game.height / 30

            GameButton
            {
                id: pause_button
                operation: "Pause Game"
            }

            GameButton
            {
                operation: "Save Game"
            }

            GameButton
            {
                operation: "Exit Game"
            }
        }
    }
}

//--------------------------------------------------------------------------------
// End of file GameScreen.qml
//--------------------------------------------------------------------------------
