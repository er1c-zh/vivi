# lib/functions.zsh

function llm_query() {
    local query="$1"
    echo "Querying LLM for: $query"
}

function llm_config() {
    echo "Configuration settings will be handled here."
}



function save_api_key() {
    local key_file="$HOME/.zshllm_mate_config"
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
    local key_file="$HOME/.zshllm_mate_config"

    if [[ -f "$key_file" ]]; then
        source "$key_file"
    else
        echo "Error: No API key found. Please configure one using 'llm config set-api-key'."
        return 1
    fi
}

function query_gemini() {
    local query="$1"
    local key_file="$HOME/.zshllm_mate_config"
    local response_file="$HOME/response.json"

    load_api_key
    local api_key="${GEMINI_API_KEY}"
    local endpoint="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$api_key"

    if [[ -z "$api_key" ]]; then
        echo "Error: Gemini API Key not configured. Run 'llm config set-api-key' first."
        return 1
    fi

    if [[ -z "$query" ]]; then
        echo "Error: No query provided."
        return 1
    fi

    local modified_query="You are a shell expert. Given that I'm using a $OSTYPE system, just provide the correct command . Do not include any extra explanation or details. Here's the situation: $query"

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


    local extracted_text=$(jq -r '.candidates[0].content.parts[0].text' "$response_file")

    printf  "$extracted_text"
}
