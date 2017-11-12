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

TEMPLATE = app

QT += qml quick

HEADERS +=

SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += javascript/theme.js

include (deployment.pri)

#--------------------------------------------------------------------------------
# End of file rescuers.pro
#--------------------------------------------------------------------------------

DISTFILES += \
    qml/title_screen.qml
