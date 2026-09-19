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
    ./install.sh

The installer symlinks the scripts into `~/.local/bin`. If that directory
isn't in your `PATH`, it will tell you the exact command to run for your
shell (bash, zsh, or fish). **Restart your terminal after that**, then try:

    audio-record 5
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
