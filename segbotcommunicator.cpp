#include "segbotcommunicator.h"
#include <termios.h>
#include <QByteArray>
#include <QProcess>
#include <QFileInfo>

static void config_tty(int fd)
{
    struct termios tty;
    memset(&tty, 0, sizeof(tty));

    tcgetattr(fd, &tty);

    tty.c_iflag &= ~IGNBRK;         // disable break processing
    tty.c_lflag = 0;                // no signaling chars, no echo,
                                    // no canonical processing

    tty.c_oflag = 0;                // no remapping, no delays

    tcsetattr(fd, TCSANOW, &tty);
}


SegBotCommunicator::SegBotCommunicator(QObject *parent)
    : QObject(parent)
    , m_active(false)
    , m_angle(0)
    , m_speedLeft(0)
    , m_speedRight(0)
    , m_sensorDistance(0)
    , m_updateTimer(nullptr)
    , m_updateInterval(100)
{

}

SegBotCommunicator::~SegBotCommunicator()
{
    delete m_updateTimer;
}

void SegBotCommunicator::init()
{
    m_updateTimer = new QTimer();
    m_updateTimer->setInterval(m_updateInterval);
    connect(m_updateTimer, SIGNAL(timeout()), this, SLOT(update()));
}

void SegBotCommunicator::setDevice(const QString &device)
{
    if (!QFileInfo::exists(device))
        return;

    //Initialize device
    QString programName("stty");
    QStringList arguments;
    arguments.append(QString("-F ") + device);
    arguments.append(QString("-isig -icanon -iexten -echo -echoe -echok -echoctl -echoke -opost -onlcr -cread"));
    QProcess::execute(programName, arguments);

    m_device = device;
    // Open the new device file
    if (!m_device.isEmpty())
        openFile();
    else
        closeFile();
}

void SegBotCommunicator::setUpdateInterval(int interval)
{
    m_updateInterval = interval;
    m_updateTimer->setInterval(m_updateInterval);
}

void SegBotCommunicator::update()
{
    // Get Updated status
    if (!m_active || !m_rpMsgFile.isOpen())
        return;

    //Angle
    int angle;
    QByteArray angleQuery("?angle");
    m_rpMsgFile.write(angleQuery);
    QByteArray response = m_rpMsgFile.read(64);
    sscanf(response.constData(), "?angle:%d", &angle);
    if (angle != m_angle) {
        m_angle = angle;
        emit angleChanged(angle);
    }

    //Speed Left
    int speedLeft;
    QByteArray speedLeftQuery("?speedLeft");
    m_rpMsgFile.write(speedLeftQuery);
    response = m_rpMsgFile.read(64);
    sscanf(response.constData(), "?speedLeft:%d", &speedLeft);
    if (speedLeft != m_speedLeft) {
        m_speedLeft = speedLeft;
        emit speedLeftChanged(speedLeft);
    }

    //Speed Right
    int speedRight;
    QByteArray speedRightQuery("?speedRight");
    m_rpMsgFile.write(speedRightQuery);
    response = m_rpMsgFile.read(64);
    sscanf(response.constData(), "?speedRight:%d", &speedRight);
    if (speedRight != m_speedRight) {
        m_speedRight = speedRight;
        emit speedRightChanged(speedRight);
    }

    //Sensor Distance
    int sensorDistance;
    QByteArray distanceQuery("?distance");
    m_rpMsgFile.write(distanceQuery);
    response = m_rpMsgFile.read(64);
    sscanf(response.constData(), "?distance:%d", &sensorDistance);
    if (sensorDistance != m_sensorDistance) {
        m_sensorDistance = sensorDistance;
        emit sensorDistanceChanged(sensorDistance);
    }
}

void SegBotCommunicator::openFile()
{
    if (m_rpMsgFile.isOpen())
        closeFile();

    m_rpMsgFile.setFileName(m_device);
    if (m_rpMsgFile.open(QIODevice::ReadWrite)) {
        m_active = true;
        config_tty(m_rpMsgFile.handle());
        m_updateTimer->start();
    } else {
        m_errorString = QString("File failed to open");
        emit errorStringChanged(m_errorString);
    }
}

void SegBotCommunicator::closeFile()
{
    m_updateTimer->stop();
    m_active = false;

    if (m_rpMsgFile.isOpen()) {
        m_rpMsgFile.close();
    }
}
