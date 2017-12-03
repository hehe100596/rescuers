//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       Player.qml
 * Date:           03. 12. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    QML file for players
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

import QtQuick 2.1

Rectangle
{
    id: player

    property int column
    property int row

    property int actionPoints
    property bool ready

    width: gameboard.width / 10
    height: gameboard.height / 8

    column: 0
    row: 0

    x: column * width
    y: row * height

    color: "transparent"
    actionPoints: 1
    ready: false

    Image
    {
        width: parent.width / 2.5
        height: parent.height / 1.5

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        source: "../img/player.jpg"
    }
}

//--------------------------------------------------------------------------------
// End of file Player.qml
//--------------------------------------------------------------------------------
