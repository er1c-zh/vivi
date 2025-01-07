
# vivi

## Description

**vivi** is a Zsh plugin that integrates language model (LLM) capabilities directly into your terminal. It allows you to send queries to the language model and receive AI-generated solutions, all within your terminal.

## Installation

1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/rufevean/ZSH-LLMate.git
    ```

2. Move the plugin directory to your Zsh plugins directory:
    ```bash
    mv ZSHLLM-Mate ~/.oh-my-zsh/plugins/zshllm-mate
    ```

3. Add `zshllm-mate` to your plugins list in `~/.zshrc`:
    ```zsh
    plugins=(... zsh-llmate)
    ```

4. Reload your shell configuration:
    ```bash
    source ~/.zshrc
    ```

## Configuration

Before using the plugin, you'll need to configure your API key.

1. Run the following command to set your Gemini API key:
    ```zsh
    vivi "vivi config set-api-key <your-api-key>"
    ```

2. If you haven't obtained your Gemini API key yet, follow the instructions in the plugin to generate and configure it.

## Commands and Usage

### Querying the LLM

Simply use the `vivi` command followed by your query. For example:

```zsh
vivi "what are the 5 latest changes in this directory?"
```

This will send the query to the LLM and output the response in your terminal.

### Example Queries

```zsh
vivi "How do I list all files in a directory?"
vivi "How to create a new directory in Linux?"
```

### Configuration Command

You can configure the plugin using the following command:

```zsh
vivi "vivi config set-api-key <your-api-key>"
```

This will save your API key for future use.

## How It Works

- When you run `vivi <query>`, the plugin sends the query to the Gemini API and returns a shell-appropriate response.
- The response from the API is executed as a shell command .

---


This version covers the basic setup, commands, and how the plugin works. It’s simple and focused on getting the user started with the core functionality.
