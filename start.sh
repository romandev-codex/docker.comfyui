#!/bin/bash
set -e
COMFYUI_DIR=/workspace/ComfyUI
VENV_PYTHON="$COMFYUI_DIR/.venv/bin/python"
echo "------------Comfyui V1.1 - Starting"
# ── Launch Jupyter Lab ───────────────────────────────────────────
echo "  → Starting Jupyter Lab on port 8888..."
if [[ $JUPYTER_PASSWORD ]]; then
    echo "Starting Jupyter Lab..."
    jupyter lab --allow-root --no-browser --port=8888 --ip='*' --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.token="$JUPYTER_PASSWORD" --ServerApp.allow_origin='*' --ServerApp.preferred_dir=/ &> /jupyter.log &
    echo "Jupyter Lab started"
fi
# ── Launch ComfyUI ───────────────────────────────────────────────
echo "  → Launching ComfyUI on port 8188..."
echo ""
exec $VENV_PYTHON "$COMFYUI_DIR/main.py" \
    --listen 0.0.0.0 \
    --port 8188 \
    --use-sage-attention
