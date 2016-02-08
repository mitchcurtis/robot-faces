#ifndef EASINGCURVE_H
#define EASINGCURVE_H

#include <QObject>
#include <QEasingCurve>

class EasingCurve : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QEasingCurve::Type type READ type WRITE setType NOTIFY typeChanged FINAL)
    Q_PROPERTY(qreal progress READ progress WRITE setProgress NOTIFY progressChanged FINAL)
    Q_PROPERTY(qreal value READ value NOTIFY valueChanged FINAL)

public:
    EasingCurve();

    QEasingCurve::Type type() const;
    void setType(const QEasingCurve::Type &type);

    qreal progress() const;
    void setProgress(const qreal &progress);

    qreal value() const;

signals:
    void typeChanged();
    void progressChanged();
    void valueChanged();

private:
    QEasingCurve::Type mType;
    qreal mProgress;
};

#endif // EASINGCURVE_H
