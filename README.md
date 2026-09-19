# 🎧 Bash Audio Tools

Simple Bash scripts for recording and playing back audio from the command line.

Created by [@JaiGuyIsland](https://github.com/JaiGuyIsland).

---

## ✨ Features

- **`audio-record <seconds>`** — Records the microphone for the given number of seconds, then plays it back.
- **`audio-playback`** — Replays the most recent recording.
- Auto-detects whatever recorder/player you already have installed.

---

## 📦 Requirements

You need a recorder and a player. The scripts pick whichever is available:

- **Recorders:** `arecord` (alsa-utils), `sox`
- **Players:** `aplay` (alsa-utils), `paplay`, `play` (sox), `ffplay`

---

## 🚀 Install

    git clone https://github.com/JaiGuyIsland/Bash-Audio-Tools.git
    cd Bash-Audio-Tools
    chmod +x audio-record audio-playback

Optionally symlink them into your `PATH`:

    mkdir -p ~/.local/bin
    ln -sf "$(pwd)/audio-record"   ~/.local/bin/audio-record
    ln -sf "$(pwd)/audio-playback" ~/.local/bin/audio-playback

---

## 🎤 Usage

Record 5 seconds:

    audio-record 5

Replay the last recording:

    audio-playback

---

## 📂 Storage

Recordings are saved to `~/.local/share/bash-audio-tools/recording.wav`. Each new recording overwrites the previous one.

---

## 📝 License

MIT — see [LICENSE](LICENSE).
