#!/usr/bin/env bash
# Install BuildshortVideos as a macOS LaunchAgent so it starts at login
# and restarts automatically if it ever crashes.
#
# Usage (run once from the project root):
#   sh scripts/install-autostart-macos.sh
#
# After installation:
#   Open browser → http://127.0.0.1:8501
#   Stop:    sh scripts/install-autostart-macos.sh --stop
#   Restart: sh scripts/install-autostart-macos.sh --restart
#   Status:  sh scripts/install-autostart-macos.sh --status
#   Logs:    tail -f ~/Library/Logs/buildshortvideos.log

set -e

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
VENV_PYTHON="$PROJECT_DIR/.venv/bin/python"
PLIST_LABEL="com.buildshortvideos.webui"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_LABEL.plist"
LOG_DIR="$HOME/Library/Logs"

_stop() {
    if launchctl list | grep -q "$PLIST_LABEL" 2>/dev/null; then
        launchctl unload "$PLIST_PATH" 2>/dev/null || true
        echo "✅ Service stopped."
    else
        echo "ℹ️  Service is not running."
    fi
}

_status() {
    if launchctl list | grep -q "$PLIST_LABEL" 2>/dev/null; then
        echo "✅ BuildshortVideos is running → http://127.0.0.1:8501"
        echo "   Logs: $LOG_DIR/buildshortvideos.log"
    else
        echo "⏹  BuildshortVideos is NOT running."
        echo "   To start: sh scripts/install-autostart-macos.sh"
    fi
}

case "${1:-}" in
    --stop)    _stop;   exit 0 ;;
    --status)  _status; exit 0 ;;
    --restart)
        _stop
        # Fall through to reinstall/load below
        ;;
esac

# Verify the virtual environment is ready
if [ ! -f "$VENV_PYTHON" ]; then
    echo "❌ Virtual environment not found at $VENV_PYTHON"
    echo "   Run this first: pip install -r requirements.txt -t .venv/lib/python3.11/site-packages"
    echo "   Or: uv sync --frozen"
    exit 1
fi

mkdir -p "$LOG_DIR"
mkdir -p "$HOME/Library/LaunchAgents"

# Write the plist with real paths filled in
cat > "$PLIST_PATH" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>${PLIST_LABEL}</string>

    <key>ProgramArguments</key>
    <array>
        <string>${VENV_PYTHON}</string>
        <string>-m</string>
        <string>streamlit</string>
        <string>run</string>
        <string>${PROJECT_DIR}/webui/Main.py</string>
        <string>--server.address=127.0.0.1</string>
        <string>--server.port=8501</string>
        <string>--browser.serverAddress=127.0.0.1</string>
        <string>--browser.gatherUsageStats=False</string>
        <string>--client.toolbarMode=minimal</string>
        <string>--logger.hideWelcomeMessage=True</string>
        <string>--server.showEmailPrompt=False</string>
        <string>--server.enableCORS=True</string>
    </array>

    <key>WorkingDirectory</key>
    <string>${PROJECT_DIR}</string>

    <key>EnvironmentVariables</key>
    <dict>
        <key>PYTHONPATH</key>
        <string>${PROJECT_DIR}</string>
        <key>HOME</key>
        <string>${HOME}</string>
        <key>PATH</key>
        <string>/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
    </dict>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardOutPath</key>
    <string>${LOG_DIR}/buildshortvideos.log</string>

    <key>StandardErrorPath</key>
    <string>${LOG_DIR}/buildshortvideos.error.log</string>

    <key>ThrottleInterval</key>
    <integer>10</integer>
</dict>
</plist>
PLIST

echo "✅ Plist written → $PLIST_PATH"

# Unload first in case a stale version is already loaded
launchctl unload "$PLIST_PATH" 2>/dev/null || true

# Load the agent (starts immediately + survives reboots)
launchctl load "$PLIST_PATH"

echo ""
echo "🚀 BuildshortVideos is starting..."
echo "   Open: http://127.0.0.1:8501   (allow ~10 seconds on first start)"
echo ""
echo "   Logs:    tail -f ${LOG_DIR}/buildshortvideos.log"
echo "   Stop:    sh scripts/install-autostart-macos.sh --stop"
echo "   Restart: sh scripts/install-autostart-macos.sh --restart"
echo "   Status:  sh scripts/install-autostart-macos.sh --status"
