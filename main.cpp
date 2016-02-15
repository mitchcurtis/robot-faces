#include <QGuiApplication>
#include <QtQml>

#include "easingcurve.h"
#include "segbot.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<EasingCurve>("App", 1, 0, "EasingCurve");
    qmlRegisterType<SegBot>("App", 1, 0, "SegBot");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
