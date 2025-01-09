#!/usr/bin/env zsh
# ZSHLLM Mate Plugin
# Description: A Zsh plugin to integrate LLM features into the terminal.
# Author: Dheeraj Chowdary
# License: MIT

source /home/$USER/.vivi/lib/functions.zsh

function vivi() {
    case $1 in
        ask)
            shift
            query_gemini "$@"
            ;;
        session)
            case $2 in
                view)
                    view_session
                    ;;
                clear)
                    clear_session
                    ;;
                *)
                    echo "Usage: vivi session <view|clear>"
                    ;;
            esac
            ;;
        config)
            case $2 in
                set-api-key)
                    shift 2
                    save_api_key "$@"
                    ;;
                *)
                    echo "Usage: vivi config <set-api-key>"
                    ;;
            esac
            ;;
        *)
            echo "Usage: vivi <command> [args]"
            echo "Commands:"
            echo "  ask <text>     - Send a query to the LLM"
            echo "  session <cmd>  - Manage session context (view|clear)"
            echo "  config <cmd>   - Configure the plugin (e.g., set API key)"
            ;;
    esac
}
