#include "segbot.h"
#include "segbotcommunicator.h"

SegBot::SegBot(QObject *parent)
    : QObject(parent)
    , m_angle(0)
    , m_speedLeft(0)
    , m_speedRight(0)
    , m_sensorDistance(0)
    , m_updateInterval(100)
    , m_voltage(0)
{
    m_segBotCommunicator = new SegBotCommunicator();
    m_communicatorThread = new QThread(this);
    m_segBotCommunicator->moveToThread(m_communicatorThread);
    connect(m_communicatorThread, SIGNAL(finished()), m_segBotCommunicator, SLOT(deleteLater()));
    m_communicatorThread->start();
    QMetaObject::invokeMethod(m_segBotCommunicator, "init", Qt::QueuedConnection);

    //Setup connections between communicator status and ours
    connect(m_segBotCommunicator, SIGNAL(angleChanged(int)), this, SLOT(onAngleChanged(int)));
    connect(m_segBotCommunicator, SIGNAL(speedLeftChanged(int)), this, SLOT(onSpeedLeftChanged(int)));
    connect(m_segBotCommunicator, SIGNAL(speedRightChanged(int)), this, SLOT(onSpeedRightChanged(int)));
    connect(m_segBotCommunicator, SIGNAL(sensorDistanceChanged(int)), this, SLOT(onSensorDistanceChanged(int)));
    connect(m_segBotCommunicator, SIGNAL(errorStringChanged(QString)), this, SLOT(onErrorStringChanged(QString)));
}

SegBot::~SegBot()
{
    m_communicatorThread->quit();
    m_communicatorThread->wait();
}

int SegBot::angle() const
{
    return m_angle;
}

int SegBot::speedLeft() const
{
    return m_speedLeft;
}

int SegBot::speedRight() const
{
    return m_speedRight;
}

int SegBot::sensorDistance() const
{
    return m_sensorDistance;
}

QString SegBot::device() const
{
    return m_device;
}

int SegBot::updateInterval() const
{
    return m_updateInterval;
}

QString SegBot::errorString() const
{
    return m_errorString;
}

int SegBot::voltage() const
{
    return m_voltage;
}

void SegBot::setDevice(QString device)
{
    if (m_device == device)
        return;

    m_device = device;
    emit deviceChanged(device);
    QMetaObject::invokeMethod(m_segBotCommunicator, "setDevice", Qt::QueuedConnection, Q_ARG(QString, device));
}

void SegBot::setUpdateInterval(int updateInterval)
{
    if (m_updateInterval == updateInterval)
        return;

    m_updateInterval = updateInterval;
    emit updateIntervalChanged(updateInterval);
    QMetaObject::invokeMethod(m_segBotCommunicator, "setUpdateInterval", Qt::QueuedConnection, Q_ARG(int, updateInterval));
}

void SegBot::setVoltage(int voltage)
{
    if (m_voltage == voltage)
        return;

    m_voltage = voltage;
    emit voltageChanged(voltage);
}

void SegBot::onAngleChanged(int angle)
{
    if (m_angle == angle)
        return;
    m_angle = angle;
    emit angleChanged(angle);
    emit valuesUpdated();
}

void SegBot::onSpeedLeftChanged(int speedLeft)
{
    if (m_speedLeft == speedLeft)
        return;
    m_speedLeft = speedLeft;
    emit speedLeftChanged(speedLeft);
    emit valuesUpdated();
}

void SegBot::onSpeedRightChanged(int speedRight)
{
    if (m_speedRight == speedRight)
        return;
    m_speedRight = speedRight;
    emit speedRightChanged(speedRight);
    emit valuesUpdated();
}

void SegBot::onSensorDistanceChanged(int sensorDistance)
{
    if (m_sensorDistance == sensorDistance)
        return;
    m_sensorDistance = sensorDistance;
    emit sensorDistanceChanged(sensorDistance);
    emit valuesUpdated();
}

void SegBot::onErrorStringChanged(const QString &errorString)
{
    if (m_errorString == errorString)
        return;
    m_errorString = errorString;
    emit errorStringChanged(errorString);
    emit valuesUpdated();
}

