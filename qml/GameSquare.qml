//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       GameSquare.qml
 * Date:           26. 11. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    QML file for gameboard square
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

import QtQuick 2.1
import "../javascript/theme.js" as Theme

Rectangle
{
    id: gamesquare

    property string state
    property bool alert
    property bool player

    property int column
    property int row

    property string leftWall
    property string topWall

    width: gameboard.width / 10
    height: gameboard.height / 8

    x: column * width
    y: row * height

    column: 0
    row: 0

    enabled: false

    leftWall: "none"
    topWall: "none"

    color: "transparent"
    state: "nothing"
    alert: false
    player: false

    function actualizeState (actual_state)
    {
        if (actual_state === "smoke") return "../img/gamesquare_smoke.jpg"

        else if (actual_state === "fire") return "../img/gamesquare_fire.jpg"

        else if (actual_state === "questionMark") return "../img/gamesquare_questionmark.jpg"

        else if (actual_state === "fakeAlert") return "../img/gamesquare_fakealert.jpg"

        else if (actual_state === "realAlert") return "../img/gamesquare_realalert.jpg" // TODO: more than one version

        else return ""
    }

    Image
    {
        width: parent.width / 2
        height: parent.height / 2

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        source: actualizeState (gamesquare.state)
    }

    Rectangle
    {
        anchors.fill: parent

        color: gamesquare.enabled ? Theme.clickable : "transparent"
        opacity: 0.5
    }

    GameWall
    {
        width: 3
        height: gamesquare.height

        state: leftWall
    }

    GameWall
    {
        width: gamesquare.width
        height: 3

        state: topWall
    }

    MouseArea
    {
        anchors.fill: parent

        onClicked: game.movePlayer (column, row)
    }
}

//--------------------------------------------------------------------------------
// End of file GameSquare.qml
//--------------------------------------------------------------------------------
