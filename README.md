# 🎧 Bash Audio Tools

Simple, dependency-light Bash scripts for recording and playing back audio from the command line.

Created by [@JaiGuyIsland](https://github.com/JaiGuyIsland).

## ✨ Features

- **`audio-record <seconds>`** — Records the microphone for the given number of seconds and auto-plays it back.
- **`audio-playback`** — Replays the most recent recording.
- Uses whatever recorder/player you already have installed (`arecord`, `aplay`, `sox`, `paplay`, `ffplay`).

## 📦 Requirements

You need **one recorder** and **one player** installed:

| Purpose   | Supported tools                                |
|-----------|------------------------------------------------|
| Recording | `arecord` (alsa-utils), `sox`                  |
| Playback  | `aplay` (alsa-utils), `paplay` (pulseaudio), `play` (sox), `ffplay` (ffmpeg) |

### Install on Debian/Ubuntu
```bash
sudo apt install alsa-utils sox
```

### Install on Fedora
```bash
sudo dnf install alsa-utils sox
```

### Install on macOS (Homebrew)
```bash
brew install sox
```
> Note: `arecord`/`aplay` are Linux-only. On macOS, `sox` will be used for both record and playback.

## 🚀 Installation

```bash
git clone https://github.com/JaiGuyIsland/Bash-Audio-Tools.git
cd Bash-Audio-Tools
chmod +x audio-record audio-playback
```

Optionally, symlink them into your `PATH`:

```bash
sudo ln -s "$(pwd)/audio-record"   /usr/local/bin/audio-record
sudo ln -s "$(pwd)/audio-playback" /usr/local/bin/audio-playback
```

## 🎤 Usage

Record 5 seconds of audio (plays it back automatically):
```bash
./audio-record 5
```

Record 10 seconds:
```bash
./audio-record 10
```

Replay the last recording:
```bash
./audio-playback
```

## 📂 Where recordings are stored

Recordings are saved to:
```
~/.local/share/bash-audio-tools/recording.wav
```

Each new recording overwrites the previous one.

## 🛠️ How it works

1. `audio-record` validates the argument, detects an available recorder, records to a WAV file, then invokes `audio-playback`.
2. `audio-playback` detects an available player and plays back the saved WAV file.

## 📝 License

MIT — see [LICENSE](LICENSE).
