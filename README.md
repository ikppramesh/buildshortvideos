# BuildshortVideos

An AI-powered short video generator. Provide a topic or keyword and it will generate a script, find footage, add subtitles, background music, and produce a high-definition short video.

## Features

- AI-generated video scripts via Groq, OpenAI, Gemini, DeepSeek, and more
- HD footage from Pexels, Pixabay, or Coverr
- Portrait (9:16) and Landscape (16:9) formats
- Edge TTS, Azure Speech, ElevenLabs, and other voice synthesis options
- Auto-generated subtitles with customizable fonts, colors, and positioning
- Background music with adjustable volume
- WebUI, API, and CLI interfaces

## Quick Start

### Prerequisites

- Python 3.11+
- [uv](https://docs.astral.sh/uv/)

### Setup

```bash
git clone https://github.com/ikppramesh/BuildshortVideos.git
cd BuildshortVideos
uv python install 3.11
uv sync --frozen
```

### Configure API Keys

Create a `.env` file in the project root:

```env
PEXELS_API_KEY=your_pexels_key
GROQ_API_KEY=your_groq_key
LLM_PROVIDER=groq
```

Get free keys:
- **Pexels** (video footage): https://www.pexels.com/api/
- **Groq** (LLM, free tier): https://console.groq.com/keys

### Launch WebUI

```bash
sh webui.sh
```

Open http://127.0.0.1:8501 in your browser.

### Launch API

```bash
python main.py
```

API docs at http://127.0.0.1:8080/docs

## Supported LLM Providers

Groq, OpenAI, Google Gemini, DeepSeek, Qwen, Azure OpenAI, Ollama, and more.
Set `LLM_PROVIDER` in `.env` to switch providers.

## License

MIT
