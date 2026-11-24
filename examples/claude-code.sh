#!/bin/sh
# Adds PinnRadar to Claude Code. Set PINNRADAR_KEY in your shell first.
claude mcp add -t http \
  -H "Authorization: Bearer $PINNRADAR_KEY" \
  pinnradar https://mcp.pinnradar.com/mcp
