#ifndef PIANOMANAGER_H
#define PIANOMANAGER_H

#include <QObject>
#include <QMap>
#include <QMediaPlayer>
#include <QMediaPlaylist>
#include <QCoreApplication>
#include <QUrl>
#include <QDebug>

class PianoManager : public QObject
{
    Q_OBJECT
public:
    explicit PianoManager(QObject *parent = nullptr);

signals:

public slots:
    void playPianoSound(const QString &note);
    void onMediaStatusChanged(QMediaPlayer::MediaStatus status);
private:
    QMediaPlayer m_mediaPlayer;
    QMediaPlaylist* m_mediaPlayList;
    QMap<QString,QString> m_map;
private:
    void init();
    void stopPianoSound();
    void setCurrentAudioByStr(const QString &note);
    bool event(QEvent *event);
};

#endif // PIANOMANAGER_H
