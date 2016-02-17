TEMPLATE = app

QT += qml quick

qtHaveModule(gamepad) {
    QT += gamepad
}

DEFINES += TESTING

CONFIG += c++11

HEADERS += \
    easingcurve.h \
    segbot.h \
    segbotcommunicator.h

SOURCES += \
    main.cpp \
    easingcurve.cpp \
    segbot.cpp \
    segbotcommunicator.cpp

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
