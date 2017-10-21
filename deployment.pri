#================================================================================
# BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
#================================================================================
#
#
# Filename:       deployment.pri
# Date:           21. 10. 2017
# Subject:        IBP - Bachelor Thesis
#
#--------------------------------------------------------------------------------

android-no-sdk {
    target.path = /data/user/qt
    export (target.path)
    INSTALLS += target
} else:android {
    x86 {
        target.path = /libs/x86
    } else: armeabi-v7a {
        target.path = /libs/armeabi-v7a
    } else {
        target.path = /libs/armeabi
    }
    export(target.path)
    INSTALLS += target
} else:unix {
    isEmpty (target.path) {
        qnx {
            target.path = /tmp/$${TARGET}/bin
        } else {
            target.path = /opt/$${TARGET}/bin
        }
        export (target.path)
    }
    INSTALLS += target
}

export (INSTALLS)

#--------------------------------------------------------------------------------
# End of file deployment.pri
#--------------------------------------------------------------------------------
