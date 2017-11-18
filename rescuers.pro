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
    img/background.jpg \
    img/icon.ico

DISTFILES += \
    qml/TitleScreen.qml \
    qml/MenuButton.qml \
    qml/ErrorMessage.qml \
    qml/SettingsScreen.qml \
    qml/SettingsComboBox.qml

#--------------------------------------------------------------------------------
# End of file rescuers.pro
#--------------------------------------------------------------------------------
