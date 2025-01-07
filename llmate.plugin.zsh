#!/usr/bin/env zsh
# ZSHLLM Mate Plugin
# Description: A Zsh plugin to integrate LLM features into the terminal.
# Author: Dheeraj Chowdary
# License: MIT

source /home/rufevean/shitbox/ZSH-LLMate/lib/functions.zsh

function vivi() {
    case $1 in
        ask)
            shift
            query_gemini "$@"
            ;;
        config)
            case $2 in
                set-api-key)
                    shift 2
                    save_api_key "$@"
                    ;;
                *)
                    echo "Usage: llm config <set-api-key>"
                    echo
                    echo "To get your Gemini API key:"
                    echo "1. Go to the Gemini API Console: https://console.cloud.google.com/"
                    echo "2. Create a project or select an existing one."
                    echo "3. Navigate to 'APIs & Services' > 'Credentials'."
                    echo "4. Generate an API Key and configure it using 'llm config set-api-key <your-api-key>'."
                    ;;
            esac
            ;;
        *)
            echo "Usage: llm <command> [args]"
            echo "Commands:"
            echo "  ask <text>  - Send a query to the LLM"
            echo "  config        - Configure the plugin (e.g., set API key)"
            ;;
    esac
}
