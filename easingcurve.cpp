#include "easingcurve.h"

#include <QEasingCurve>

EasingCurve::EasingCurve()
{
}

QEasingCurve::Type EasingCurve::type() const
{
    return mType;
}

void EasingCurve::setType(const QEasingCurve::Type &type)
{
    if (type == mType)
        return;

    mType = type;
    emit typeChanged();
}

qreal EasingCurve::progress() const
{
    return mProgress;
}

void EasingCurve::setProgress(const qreal &progress)
{
    if (progress == mProgress)
        return;

    mProgress = progress;
    emit progressChanged();
    emit valueChanged();
}

qreal EasingCurve::value() const
{
    return QEasingCurve(mType).valueForProgress(mProgress);
}
