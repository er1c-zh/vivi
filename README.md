# vivi-light

# vivi-light forked from [vivi](https://github.com/rufevean/vivi) .

## Description

**vivi-light** is a zsh plugin allow you to simplely ask gemini in cli.

vivi-light forked from [vivi](https://github.com/rufevean/vivi) .

### Difference

- **vivi-light** can work on macos.

- **vivi-light** doesn't execute the result, but display on screen only.

## Installation

### manual

```zsh
git clone https://github.com/er1c-zh/vivi.git
source ~/.zshrc
```

### use `zplug`

```zshrc
zplug "er1c-zh/vivi", depth:1, as:plugin, use:"vivi.plugin.zsh"
```

## Configuration

Before using the plugin, you'll need to configure your API key.

1. Run the following command to set your Gemini API key:

    ``` zsh
    vivi "vivi config set-api-key <your-api-key>"
    ```

1. If you haven't obtained your Gemini API key yet, you get the key at [here](https://aistudio.google.com/app/apikey) .

## Commands and Usage

### Querying the LLM

Use the `vivi ask` command followed by your query. For example:

```zsh
vivi ask "How do I list all files in the current directory?"
```

### Example Queries

```zsh
vivi ask"Find all files containing 'example' in this directory."
vivi ask "Create and navigate into a directory called 'projects'."
vivi ask "Kill the process running on port 8080."
```

### Configuration Commands

You can configure the plugin using the following commands:

- **Set API Key**:

    ```zsh
    vivi config set-api-key <your-api-key>
    ```

This saves your API key for all future queries.

---

