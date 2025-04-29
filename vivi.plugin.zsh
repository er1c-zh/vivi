#!/usr/bin/env zsh
# ZSHLLM Mate Plugin
# Description: A Zsh plugin to integrate LLM features into the terminal.
# Author: Dheeraj Chowdary
# License: MIT

source $(dirname $0)/lib/functions.zsh
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
                  echo
                    echo "To get your Gemini API key:"
                    echo "1. Go to the Gemini API Console: https://console.cloud.google.com/"
                    echo "2. Create a project or select an existing one."
                    echo "3. Navigate to 'APIs & Services' > 'Credentials'."
                    echo "4. Generate an API Key and configure it using 'vivi config set-api-key <your-api-key>'."
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
