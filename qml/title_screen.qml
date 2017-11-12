//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       main.qml
 * Date:           21. 10. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    Main qml file
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

import QtQuick 2.1
import QtQuick.Window 2.0
import "../javascript/theme.js" as Theme

Window
{
    visible: true

    width: 1280
    height: 720

    title: "RESCUERS"

    Image
    {
        width: parent.width
        height: parent.height
        source: "../img/background.jpg"
    }
}

//--------------------------------------------------------------------------------
// End of file main.qml
//--------------------------------------------------------------------------------
