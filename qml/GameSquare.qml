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

Rectangle
{
    id: gamesquare

    property string state

    width: gameboard.width / 10
    height: gameboard.height / 8

    color: "transparent"
    state: "nothing"

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
        width: parent.width / 1.5
        height: parent.height / 1.5

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        source: actualizeState (gamesquare.state)
    }
}

//--------------------------------------------------------------------------------
// End of file GameSquare.qml
//--------------------------------------------------------------------------------
