#ifndef SEGBOT_H
#define SEGBOT_H

#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QTimer>
#include <QtCore/QFile>
#include <QtCore/QTextStream>
#include <QtCore/QThread>

class SegBotCommunicator;

class SegBot : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int angle READ angle NOTIFY angleChanged)
    Q_PROPERTY(int speedLeft READ speedLeft NOTIFY speedLeftChanged)
    Q_PROPERTY(int speedRight READ speedRight NOTIFY speedRightChanged)
    Q_PROPERTY(int sensorDistance READ sensorDistance NOTIFY sensorDistanceChanged)
    Q_PROPERTY(QString device READ device WRITE setDevice NOTIFY deviceChanged)
    Q_PROPERTY(int updateInterval READ updateInterval WRITE setUpdateInterval NOTIFY updateIntervalChanged)
    Q_PROPERTY(QString errorString READ errorString NOTIFY errorStringChanged)
    Q_PROPERTY(int voltage READ voltage WRITE setVoltage NOTIFY voltageChanged)
public:
    explicit SegBot(QObject *parent = 0);
    ~SegBot();

    int angle() const;
    int speedLeft() const;
    int speedRight() const;
    int sensorDistance() const;
    QString device() const;
    int updateInterval() const;
    QString errorString() const;
    int voltage() const;

public slots:
    void setDevice(QString device);
    void setUpdateInterval(int updateInterval);
    void setVoltage(int voltage);

signals:
    void angleChanged(int angle);
    void speedLeftChanged(int speedLeft);
    void speedRightChanged(int speedRight);
    void sensorDistanceChanged(int sensorDistance);
    void deviceChanged(QString device);
    void updateIntervalChanged(int updateInterval);
    void errorStringChanged(QString errorString);
    void valuesUpdated();
    void voltageChanged(int voltage);

private slots:
    void onAngleChanged(int angle);
    void onSpeedLeftChanged(int speedLeft);
    void onSpeedRightChanged(int speedRight);
    void onSensorDistanceChanged(int sensorDistance);
    void onErrorStringChanged(const QString &errorString);

private:
    int m_angle;
    int m_speedLeft;
    int m_speedRight;
    int m_sensorDistance;
    int m_updateInterval;
    QString m_device;
    QString m_errorString;

    SegBotCommunicator *m_segBotCommunicator;
    QThread *m_communicatorThread;
    int m_voltage;
};

#endif // SEGBOT_H
