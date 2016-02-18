#ifndef SEGBOTCOMMUNICATOR_H
#define SEGBOTCOMMUNICATOR_H

#include <QtCore/QObject>
#include <QtCore/QTimer>
#include <QtCore/QFile>
#include <QtCore/QTextStream>
#include <QtCore/QString>

class QGamepad;

class SegBotCommunicator : public QObject
{
    Q_OBJECT
public:
    explicit SegBotCommunicator(QObject *parent = 0);
    ~SegBotCommunicator();

signals:
    void angleChanged(int angle);
    void speedLeftChanged(int speedLeft);
    void speedRightChanged(int speedRight);
    void sensorDistanceChanged(int sensorDistance);
    void errorStringChanged(const QString &errorString);
    void voltageChanged(int voltage);

public slots:
    void init();
    void setDevice(const QString &device);
    void setUpdateInterval(int interval);

private slots:
    void update();
    void turnLeft(bool pressed);
    void turnRight(bool pressed);
    void forward(bool pressed);
    void reverse(bool pressed);
    void stop();

private:
    void openFile();
    void closeFile();

    bool m_active;

    int m_angle;
    int m_speedLeft;
    int m_speedRight;
    int m_sensorDistance;
    QString m_device;
    int m_voltage;

    QTimer *m_updateTimer;
    int m_updateInterval;

    QFile m_rpMsgFile;
    QString m_errorString;
    QGamepad *m_gamepad;
};

#endif // SEGBOTCOMMUNICATOR_H
