#include "pianomanager.h"

PianoManager::PianoManager(QObject *parent) : QObject(parent)
{
    // 初始化播放器和播放列表
    m_mediaPlayer.setVolume(80);
    m_mediaPlayer.setAudioRole(QAudio::MusicRole);

    m_mediaPlayList = new QMediaPlaylist();

    // 初始化音频资源
    init();

    // 预加载所有音频资源
    foreach (const QString &audioPath, m_map) {
        m_mediaPlayList->addMedia(QUrl(audioPath));
    }

    m_mediaPlayer.setPlaylist(m_mediaPlayList);
    connect(&m_mediaPlayer, &QMediaPlayer::mediaStatusChanged, this, &PianoManager::onMediaStatusChanged);
}

void PianoManager::playPianoSound(const QString &note)
{
    // 停止当前播放，防止重叠播放
    if (m_mediaPlayer.state() == QMediaPlayer::PlayingState) {
        stopPianoSound();
    }
    // 设置当前播放音频资源
    setCurrentAudioByStr(note);
    // 异步播放音频
    QCoreApplication::postEvent(this, new QEvent(QEvent::User));
}

void PianoManager::onMediaStatusChanged(QMediaPlayer::MediaStatus status)
{
    qDebug() << "onMediaStatusChanged" << status;
    if (status == QMediaPlayer::EndOfMedia) {
        stopPianoSound();
    }
}

void PianoManager::init()
{
    QString mp3PathTemplate = "qrc:/audio/%1.mp3";
    char _char[] = {'A','B','C','D','E','F','G'};
    char _num[] = {'1','2','3','4','5','6','7'};
    for(int i=0;i<7;i++){
        for(int j=0;j<7;j++){
            char str[3] = { _char[i] , _num[j] ,'\0'};
            QString key(str);
            m_map[key] = mp3PathTemplate.arg(key);
        }
    }
}

void PianoManager::stopPianoSound()
{
    qDebug() << "stop PianoSound";
    m_mediaPlayer.stop();
    m_mediaPlayer.setPosition(0);
}

void PianoManager::setCurrentAudioByStr(const QString &note)
{
    int targetIndex = -1;
    int currentIndex = m_mediaPlayList->currentIndex();
    auto it = m_map.find(note);
    if(it != m_map.end()){
        for (int i = 0; i < m_mediaPlayList->mediaCount(); ++i) {
            if (m_mediaPlayList->media(i).canonicalUrl().toString() == it.value()) {
                targetIndex = i;
                break;
            }
        }
        if(currentIndex != targetIndex){
            m_mediaPlayList->setCurrentIndex(targetIndex);
        }
    }
}

bool PianoManager::event(QEvent *event)
{
    if (event->type() == QEvent::User) {
        m_mediaPlayer.play();
        return true;
    }
    return QObject::event(event);
}

