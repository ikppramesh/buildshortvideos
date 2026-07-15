<div align="center">

# 🎬 BuildshortVideos

### AI-Powered Short Video Generator

Provide a **topic** or **keyword** and BuildshortVideos will automatically generate a script, source HD footage, synthesize voiceover, add subtitles and background music, and produce a publish-ready short video — in minutes.

[![Python](https://img.shields.io/badge/python-3.11%2B-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows%20%7C%20Linux-lightgrey)](https://github.com/ikppramesh/BuildshortVideos)

</div>

---

## ✨ Features

| Category | Details |
|---|---|
| 🤖 **AI Script Generation** | Groq (Llama 3.3 70B), OpenAI, Gemini, DeepSeek, Qwen, Azure, Ollama, and more |
| 🎥 **HD Footage** | Pexels, Pixabay, Coverr, or your own local assets |
| 🗣️ **Voice Synthesis** | Edge TTS (free), Azure Speech, ElevenLabs, SiliconFlow, Google Gemini TTS |
| 📝 **Smart Subtitles** | Auto-generated with customizable font, color, position, size, outline & background |
| 🎵 **Background Music** | Random, custom upload, or Sonilo AI-matched music |
| 📐 **Video Formats** | Portrait 9:16 (Reels / TikTok / Shorts) and Landscape 16:9 |
| 🌍 **Multi-language** | English, Hindi, Telugu, Tamil, Kannada, Malayalam, Bengali, Gujarati, Marathi, Punjabi, Urdu, Chinese, German, French, Spanish, Russian, and more |
| 🖥️ **Interfaces** | WebUI, REST API, and CLI |
| 🎨 **Theme** | Dark gold glassmorphism UI |

---

## 🖥️ Screenshots

> WebUI running locally with dark gold glassmorphism theme.

---

## 📦 System Requirements

| Component | Minimum | Recommended |
|---|---|---|
| Python | 3.11 | 3.11 |
| CPU | 4 cores | 8+ cores |
| RAM | 4 GB | 16 GB |
| Storage | 2 GB free | 10 GB free |
| OS | macOS 11+, Ubuntu 20.04+, Windows 10+ | — |

> GPU is optional but speeds up batch generation and local transcription.

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/ikppramesh/BuildshortVideos.git
cd BuildshortVideos
```

### 2. Install Dependencies

**Recommended — using [uv](https://docs.astral.sh/uv/) (fastest):**

```bash
# Install uv (one-time)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Python 3.11 and all dependencies
uv python install 3.11
uv sync --frozen
```

**Alternative — using pip:**

```bash
python3.11 -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Configure API Keys

Create a `.env` file in the project root:

```env
# --- Video Footage (choose one) ---
PEXELS_API_KEY=your_pexels_key         # https://www.pexels.com/api/
PIXABAY_API_KEY=your_pixabay_key       # https://pixabay.com/api/docs/

# --- LLM Provider (choose one) ---
GROQ_API_KEY=your_groq_key             # https://console.groq.com/keys  (free tier)
OPENAI_API_KEY=your_openai_key         # https://platform.openai.com/api-keys
GEMINI_API_KEY=your_gemini_key         # https://aistudio.google.com/app/apikey
DEEPSEEK_API_KEY=your_deepseek_key     # https://platform.deepseek.com/api_keys

# --- Active provider ---
LLM_PROVIDER=groq
```

> `.env` is gitignored — your keys never get committed.

### 4. Launch the WebUI

```bash
# macOS / Linux
sh webui.sh

# Windows
webui.bat
```

Open **http://127.0.0.1:8501** in your browser.

---

## 🔑 Free API Keys

All of these have a free tier — no credit card required:

| Service | Purpose | Free Tier |
|---|---|---|
| [Groq](https://console.groq.com/keys) | LLM (script generation) | Generous free requests |
| [Pexels](https://www.pexels.com/api/) | HD video footage | Unlimited |
| [Pixabay](https://pixabay.com/api/docs/) | HD video footage | Unlimited |
| [Google Gemini](https://aistudio.google.com/app/apikey) | LLM | Free tier available |
| [DeepSeek](https://platform.deepseek.com/api_keys) | LLM | Free credits on signup |

---

## 🌐 Supported Languages

### UI Interface Languages
Switch the app interface between:
- **English** (default)
- **हिन्दी** (Hindi)
- **తెలుగు** (Telugu)
- Chinese (Simplified / Traditional / HK)
- German, Spanish, French, Russian, Vietnamese, Turkish, Indonesian, Portuguese

### Video Script & Voice Languages

Indian languages fully supported for script generation and Edge TTS voiceover:

| Code | Language |
|---|---|
| `en-US` | English (US) |
| `en-IN` | English (India) |
| `hi-IN` | हिन्दी — Hindi |
| `te-IN` | తెలుగు — Telugu |
| `ta-IN` | தமிழ் — Tamil |
| `kn-IN` | ಕನ್ನಡ — Kannada |
| `ml-IN` | മലയാളം — Malayalam |
| `mr-IN` | मराठी — Marathi |
| `bn-IN` | বাংলা — Bengali |
| `gu-IN` | ગુજરાતી — Gujarati |
| `pa-IN` | ਪੰਜਾਬੀ — Punjabi |
| `ur-IN` | اردو — Urdu |

Plus Chinese, German, French, Spanish, Russian, Vietnamese, Thai, Turkish, and more.

---

## 🤖 Supported LLM Providers

| Provider | Free Tier | Notes |
|---|---|---|
| **Groq** | ✅ Yes | Llama 3.3 70B — fast & free |
| **Google Gemini** | ✅ Limited | Free tier, paid for heavy use |
| **DeepSeek** | ✅ Credits | Very low cost |
| **OpenAI** | ❌ Paid | GPT-4o / GPT-4.1 |
| **Qwen** (Alibaba) | ✅ Limited | DashScope API |
| **Azure OpenAI** | ❌ Paid | Enterprise deployments |
| **Ollama** | ✅ Local | No API key, runs on-device |
| **Moonshot / Kimi** | ✅ Credits | Strong long-context capability |
| **Cloudflare AI Gateway** | ✅ Limited | Unified gateway |
| **Pollinations AI** | ✅ Yes | No key required |

Switch providers by setting `LLM_PROVIDER` in your `.env` file.

---

## 🗣️ Supported TTS (Voice) Providers

| Provider | Free | Indian Language Support |
|---|---|---|
| **Edge TTS** | ✅ Free | ✅ Full (hi, te, ta, kn, ml, mr, bn, gu, pa, ur) |
| **Azure Speech** | ❌ Paid | ✅ Excellent |
| **Google Gemini TTS** | ✅ Limited | ✅ Good |
| **ElevenLabs** | ✅ Limited | ✅ Good |
| **SiliconFlow** | ✅ Limited | Partial |

> **Edge TTS** is the default — completely free, no API key needed, and supports all major Indian languages.

---

## 🎥 Supported Video Sources

| Source | Free | Notes |
|---|---|---|
| **Pexels** | ✅ Free API | High quality, large library |
| **Pixabay** | ✅ Free API | Good variety |
| **Coverr** | ✅ Free API | Cinematic footage |
| **Local files** | ✅ | Use your own videos |

---

## 📡 API Usage

The REST API runs on port `8080` alongside the WebUI.

### Start the API server

```bash
python main.py
```

### API Documentation

- Swagger UI: http://127.0.0.1:8080/docs
- ReDoc: http://127.0.0.1:8080/redoc

### Example — Generate a video

```bash
curl -X POST http://127.0.0.1:8080/api/v1/videos \
  -H "Content-Type: application/json" \
  -d '{
    "video_subject": "How AI is changing everyday life",
    "video_language": "en-US",
    "voice_name": "en-US-AriaNeural-Female",
    "video_aspect": "9:16",
    "video_source": "pexels",
    "subtitle_enabled": true
  }'
```

---

## 💻 CLI Usage

```bash
# Generate a video from the command line
python cli.py \
  --subject "Benefits of meditation" \
  --language en-US \
  --voice en-US-GuyNeural-Male \
  --aspect 9:16 \
  --source pexels
```

---

## ⚙️ Configuration Reference

All settings live in `config.toml` (auto-created on first run from `config.example.toml`).
Secrets should go in `.env` — they are injected at startup and never written to `config.toml`.

### Key `.env` Variables

```env
# Footage
PEXELS_API_KEY=...
PIXABAY_API_KEY=...
COVERR_API_KEY=...

# LLM
LLM_PROVIDER=groq          # groq | openai | gemini | deepseek | qwen | moonshot | ollama | ...
GROQ_API_KEY=...
OPENAI_API_KEY=...
GEMINI_API_KEY=...
DEEPSEEK_API_KEY=...
MOONSHOT_API_KEY=...
QWEN_API_KEY=...
AZURE_OPENAI_API_KEY=...
```

### Key `config.toml` Settings

```toml
[app]
video_source      = "pexels"       # pexels | pixabay | coverr | local
llm_provider      = "groq"
log_level         = "INFO"
listen_port       = 8080
```

---

## 🐳 Docker (Optional)

```bash
# Using pre-built image
docker compose -f docker-compose.release.yml up

# Build locally
docker compose up
```

WebUI: http://127.0.0.1:8501 | API: http://127.0.0.1:8080/docs

---

## 📁 Project Structure

```
BuildshortVideos/
├── app/
│   ├── config/        # Config loading with .env injection
│   ├── models/        # LLM providers, schema definitions
│   ├── services/      # Core logic: LLM, TTS, video, subtitles, material
│   └── utils/         # Helpers, i18n loader
├── webui/
│   ├── Main.py        # Streamlit WebUI
│   ├── styles.css     # Gold glassmorphism theme
│   └── i18n/          # UI translations (en, hi, te, zh, de, ...)
├── resource/
│   ├── fonts/         # Subtitle fonts
│   └── songs/         # Background music
├── docs/
│   └── skill/         # AI Agent skill (SKILL.md + mpt_agent.py)
├── .env               # Your API keys (gitignored)
├── config.toml        # App configuration (gitignored)
├── config.example.toml
├── main.py            # API server entry point
├── cli.py             # CLI entry point
├── webui.sh           # WebUI launcher (macOS/Linux)
├── webui.bat          # WebUI launcher (Windows)
└── pyproject.toml
```

---

## 🔒 Security

- API keys are stored in `.env` — never in `config.toml` or committed to git
- `.env` and `config.toml` are both in `.gitignore`
- `.env` is loaded at startup and injected into the running config — not persisted to disk

---

## 🛠️ Development

```bash
# Install dev dependencies
uv sync --group dev

# Run tests
pytest

# Lint
ruff check .
```

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

<div align="center">
Built with ❤️ · <a href="https://github.com/ikppramesh/BuildshortVideos/issues">Report a Bug</a>
</div>
