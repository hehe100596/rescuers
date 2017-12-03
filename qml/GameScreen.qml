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
import "../javascript/gameboard.js" as GameBoard

Window
{
    id: game

    visible: true
    modality: Qt.ApplicationModal

    property int difficulty
    property int players
    property int building
    property bool timer

    property int dead
    property int saved
    property int damaged

    property var clock
    property int onMove
    property int currentAP
    property int turn

    width: window.width
    height: window.height

    minimumWidth: 640
    minimumHeight: 360

    difficulty: window.difficulty === "Easy" ? 1 : window.difficulty === "Medium" ? 2 : 3
    players: parseInt (window.players)
    building: window.building === "1st Edition" ? 0 : 1
    timer: window.timer === "OFF" ? false : true

    dead: 0
    saved: 0
    damaged: 0

    clock: new Date (0, 0, 0, 0, 0, 0)
    onMove: 1
    currentAP: 1
    turn: 0

    title: "RESCUERS - Game Screen"

    onVisibleChanged:
    {
        window.show ()
        pageLoader.source = ""
    }

    function executeGameButton (operation)
    {
        if (operation === "Pause Game") pauseGame ()

        if (operation === "Save Game") showErrorMessage ("Saving and loading is not implemented in this version.")

        if (operation === "Exit Game") game.close ()
    }

    function actualizeTimer (actual_time, seconds)
    {
        if (actual_time.getHours () < 24) actual_time.setSeconds (actual_time.getSeconds () + seconds)
        return actual_time
    }

    function movePlayer (column, row)
    {
        GameBoard.moveCurrentPlayer (column, row)
    }

    function pauseGame ()
    {
        if (timer.running)
        {
            timer.stop ()
            pause_button.button_text = "Resume Game"
            gameboard.enabled = false
        }
        else
        {
            timer.start ()
            pause_button.button_text = "Pause Game"
            gameboard.enabled = true
        }
    }

    function gameOver ()
    {
        timer.stop ()
        showErrorMessage ("Game over. You lose.")
        gameboard.enabled = false
    }

    Component.onCompleted:
    {
        setX (Screen.width / 2 - width / 2)
        setY (Screen.height / 2 - height / 2)
        window.show ()
    }

    Image
    {
        width: parent.width / 1.3
        height: parent.height
        source: game.building === 0 ? "../img/1st_edition_gameboard.jpg" : "../img/2nd_edition_gameboard.jpg"

        Rectangle
        {
            id: gameboard

            width: parent.width - parent.width / 9.8
            height: parent.height

            anchors.left: parent.left
            anchors.leftMargin: parent.width / 9.8

            color: "transparent"

            Component.onCompleted: GameBoard.startGame ()
        }
    }

    Item // TODO: delete after testing is done
    {
        focus: true

        Keys.onPressed:
        {
            if (event.key == Qt.Key_Space)
            {
                GameBoard.addSmoke ()
                GameBoard.checkAfterEffects ()
            }
        }
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
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 1.22

        anchors.top: parent.top
        anchors.topMargin: parent.height / 30

        Column
        {
            spacing: game.height / 40

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 120
                color: game.timer ? Theme.combo_box : Theme.button

                text: (game.clock).toLocaleTimeString ()
            }

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Dead - " + game.dead + "/4"
            }

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Saved - " + game.saved + "/7"
            }

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Damaged - " + game.damaged + "/24"
            }
        }
    }

    Row
    {
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 1.22

        anchors.top: parent.top
        anchors.topMargin: parent.height / 2.8

        Column
        {
            spacing: game.height / 40

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 120
                color: Theme.button

                text: "PLAYER " + game.onMove
            }

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Turn: " + game.turn
            }

            Text
            {
                font.bold: true
                font.pointSize: (game.height + game.width) / 140
                color: Theme.button

                text: "Action points: " + game.currentAP
            }
        }
    }

    Row
    {
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 30

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 30

        Column
        {
            spacing: game.height / 40

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
