//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       main.cpp
 * Date:           21. 10. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    Main program file
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main (int argc, char * argv [])
{
    QGuiApplication app (argc, argv);

    QQmlApplicationEngine engine;
    engine.load (QUrl (QStringLiteral ("qrc:///qml/main.qml")));

    return app.exec ();
}

//--------------------------------------------------------------------------------
// End of file main.cpp
//--------------------------------------------------------------------------------
