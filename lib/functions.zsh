# lib/functions.zsh

function llm_query() {
    local query="$1"
    echo "Querying LLM for: $query"
}

function llm_config() {
    echo "Configuration settings will be handled here."
}



function save_api_key() {
    local key_file="$HOME/.vivi_config"
    local api_key="$1"

    if [[ -z "$api_key" ]]; then
        echo "Error: No API key provided."
        return 1
    fi

    echo "GEMINI_API_KEY=\"$api_key\"" > "$key_file"
    chmod 600 "$key_file"
    echo "OpenAI API Key has been saved."
}


function load_api_key() {
    local key_file="$HOME/.vivi_config"

    if [[ -f "$key_file" ]]; then
        source "$key_file"
    else
        echo "Error: No API key found. Please configure one using 'llm config set-api-key'."
        return 1
    fi
}


function query_gemini() {
    local query="$1"
    local key_file="$HOME/.vivi_config"
    local response_file="$HOME/response.json"
    local plugin_dir="/home/$USER/.vivi"
    local temp_script="$plugin_dir/.vivi_temp_script.zsh"
    local session_file="$plugin_dir/.vivi_session" # Session context file

    load_api_key
    local api_key="${GEMINI_API_KEY}"
    local endpoint="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$api_key"

    if [[ -z "$api_key" ]]; then
        echo "Error: Gemini API Key not configured. Run 'vivi config set-api-key' first."
        return 1
    fi

    if [[ -z "$query" ]]; then
        echo "Error: No query provided."
        return 1
    fi

    # Load session context
    local session_context=""
    if [[ -f "$session_file" ]]; then
        session_context=$(<"$session_file")
    fi

    # Combine session context with user query
    local modified_query="You are a Zsh scripting expert. I am working in a terminal with Zsh shell. Respond only with valid Zsh code that solves the following problem. Do not include any explanation, comments, or formatting like '''zsh. Just provide the raw Zsh code . Here's the context of my session:\n\n$session_context\n\nGiven that I'm using a $OSTYPE system, just provide the correct command for this situation: $query"

    curl -s -X POST "$endpoint" \
        -H "Content-Type: application/json" \
        -d '{
            "contents": [{
                "parts": [{
                    "text": "'"$modified_query"'"
                }]
            }]
        }' > "$response_file"

    if [[ ! -f "$response_file" ]]; then
        echo "Error: Failed to save response."
        return 1
    fi

    local extracted_text
    extracted_text=$(jq -r '.candidates[0].content.parts[0].text' "$response_file")

    if [[ -n "$extracted_text" ]]; then
        # Append query and response to session context
        echo "Query: $query" >> "$session_file"
        echo "Response: $extracted_text" >> "$session_file"
        echo "---" >> "$session_file"

        echo "#!/usr/bin/env zsh" > "$temp_script"
        echo "$extracted_text" >> "$temp_script"
        chmod +x "$temp_script"
        source "$temp_script"
        zsh "$temp_script"
        rm "$temp_script"
    else
        echo "Error: No valid response received from Gemini."
        return 1
    fi
}

function view_session() {
    local session_file="/home/$USER/.vivi/.vivi_session"
    if [[ -f "$session_file" ]]; then
        cat "$session_file"
    else
        echo "No session context found."
    fi
}


function clear_session() {
    local session_file="/home/$USER/.vivi/.zshllm_session"
    if [[ -f "$session_file" ]]; then
        > "$session_file"
        echo "Session context cleared."
    else
        echo "No session context to clear."
    fi
}
