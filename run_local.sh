#!/usr/bin/env bash
# Rollin' Ace 维基 本地预览服务管理：start / stop / restart / status
set -e
cd "$(dirname "$0")"

PORT="${PORT:-8094}"
PIDFILE=".server.pid"

# 读取已保存的 PID（如果存在）
get_pid() {
  if [[ -f "$PIDFILE" ]]; then
    cat "$PIDFILE"
  fi
}

is_running() {
  local pid; pid="$(get_pid)"
  [[ -n "${pid}" ]] && kill -0 "${pid}" 2>/dev/null
}

start() {
  if is_running; then
    echo "已在运行: http://localhost:${PORT}/ (pid $(get_pid))"
    return 0
  fi
  echo "启动 Rollin' Ace 维基 预览: http://localhost:${PORT}/"
  # 后台运行，日志写入 .server.log；--yes 跳过 npx 交互确认
  nohup npx --yes http-server . -p "${PORT}" -c-1 \
    > .server.log 2>&1 &
  echo $! > "$PIDFILE"
  sleep 1
  if is_running; then
    echo "已启动 (pid $(get_pid))"
  else
    echo "启动失败，请查看 .server.log"
    return 1
  fi
}

stop() {
  if is_running; then
    kill "$(get_pid)" 2>/dev/null || true
    rm -f "$PIDFILE"
    echo "已停止"
  else
    rm -f "$PIDFILE"
    echo "未在运行"
  fi
}

restart() {
  echo "重启中..."
  stop
  start
}

status() {
  if is_running; then
    echo "运行中: http://localhost:${PORT}/ (pid $(get_pid))"
  else
    echo "未运行"
  fi
}

case "${1:-start}" in
  start)    start ;;
  stop)     stop ;;
  restart)  restart ;;
  status)   status ;;
  *)        echo "用法: ./run_local.sh {start|stop|restart|status}" >&2; exit 1 ;;
esac