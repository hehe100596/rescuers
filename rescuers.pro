#================================================================================
# BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
#================================================================================
#
#
# Filename:       rescuers.pro
# Date:           21. 10. 2017
# Subject:        IBP - Bachelor Thesis
# Description:    Main project file
# Author:         Juraj Bačovčin
#                 (xbacov04@stud.fit.vutbr.cz)
#
#--------------------------------------------------------------------------------

include (deployment.pri)

TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += \
    javascript/theme.js \
    javascript/gameboard.js \
    img/background.jpg \
    img/1st_edition_gameboard.jpg \
    img/2nd_edition_gameboard.jpg \
    img/gamesquare_fakealert.jpg \
    img/gamesquare_fire.jpg \
    img/gamesquare_questionmark.jpg \
    img/gamesquare_realalert.jpg \
    img/gamesquare_smoke.jpg \
    img/gamewall_damaged.jpg \
    img/gamewall_destroyed.jpg \
    img/gamewall_opened.jpg \
    img/gamewall_closed.jpg \
    img/player.jpg \
    img/icon.ico

DISTFILES += \
    qml/TitleScreen.qml \
    qml/MenuButton.qml \
    qml/ErrorMessage.qml \
    qml/SettingsScreen.qml \
    qml/SettingsComboBox.qml \
    qml/GameScreen.qml \
    qml/GameButton.qml \
    qml/GameSquare.qml \
    qml/GameWall.qml \
    qml/Player.qml

#--------------------------------------------------------------------------------
# End of file rescuers.pro
#--------------------------------------------------------------------------------
