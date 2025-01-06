#!/usr/bin/env zsh
# ZSHLLM Mate Plugin
# Description: A Zsh plugin to integrate LLM features into the terminal.
# Author: Dheeraj  Chowdary
# License: MIT

source /home/rufevean/shitbox/ZSH-LLMate/lib/functions.zsh

function llm() {
    case $1 in
        query)
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
                    echo "1. Go to the Gemini API Console: https://console.cloud.google.com/ (make sure you are logged in)"
                    echo "2. Create a new project or select an existing project."
                    echo "3. Navigate to 'APIs & Services' > 'Credentials'."
                    echo "4. Click on 'Create Credentials' and select 'API Key'."
                    echo "5. Copy the generated API Key."
                    echo "6. Run: 'llm config set-api-key <your-api-key>' to configure it in the plugin."
                    ;;
            esac
            ;;
        *)
            echo "Usage: llm <command> [args]"
            echo "Commands:"
            echo "  query <text>  - Send a query to the LLM"
            echo "  config        - Configure the plugin (e.g., set API key)"
            ;;
    esac
}
