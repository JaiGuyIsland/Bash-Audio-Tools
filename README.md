# 🎧 Bash Audio Tools

Simple Bash scripts for recording, playing back, and managing audio from the command line.

Created by [@JaiGuyIsland](https://github.com/JaiGuyIsland).

---

## ✨ Features

- **`audio-record <seconds>`** — Records the microphone for the given number of seconds, then plays it back. Saves a unique timestamped file.
- **`audio-playback`** — Replays your most recent recording.
- **`audio-list`** — Opens an interactive menu to view, replay, or delete your saved recordings.
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

The installer will:

- Make the scripts executable
- Symlink them into `~/.local/bin`
- Warn you if `~/.local/bin` isn't in your `PATH`
- Check for a recorder and player

---

## 🎤 Usage

Record 5 seconds:

    audio-record 5

Replay the last recording:

    audio-playback

Manage all your recordings:

    audio-list

---

## 📂 Storage

Recordings are saved to `~/.local/share/bash-audio-tools/` as timestamped `.wav` files (e.g., `recording_20260921_153000.wav`). You can easily clear out old files using the `audio-list` command.

---

## 📝 License

MIT — see [LICENSE](LICENSE).
