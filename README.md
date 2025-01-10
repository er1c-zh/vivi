

# vivi

## Description

**vivi** is a Zsh plugin that integrates language model (LLM) capabilities directly into your terminal. It allows you to send queries to the language model and receive AI-generated solutions, all within your terminal. The plugin supports session context and can dynamically execute received commands.



### Installation Script
To install vivi, run the following commands:

```zsh
curl -o install_vivi.zsh https://raw.githubusercontent.com/rufevean/vivi/main/install_vivi.zsh
chmod +x install_vivi.zsh
./install_vivi.zsh
```


**RELOAD YOUR SHELL CONFIGURATION**

``` zsh
source ~/.zshrc

```
### Update Script
To update vivi to the latest version, run the following commands:

```zsh
curl -o update_vivi.zsh https://raw.githubusercontent.com/rufevean/vivi/main/update_vivi.zsh
chmod +x update_vivi.zsh
./update_vivi.zsh
```

### Uninstallation Script
To completely uninstall vivi, run the following commands:

```zsh
curl -o uninstall_vivi.zsh https://raw.githubusercontent.com/rufevean/vivi/main/uninstall_vivi.zsh
chmod +x uninstall_vivi.zsh
./uninstall_vivi.zsh
```
## Configuration

Before using the plugin, you'll need to configure your API key.

1. Run the following command to set your Gemini API key:
    ``` zsh
    vivi "vivi config set-api-key <your-api-key>"
    ```

2. If you haven't obtained your Gemini API key yet, follow these steps:
    - Visit the Gemini API Console at https://console.cloud.google.com/.
    - Create or select an existing project.
    - Navigate to "APIs & Services" > "Credentials" and generate an API key.
    - Use the above command to configure the plugin with your API key.

## Commands and Usage

### Querying the LLM

Use the `vivi ask` command followed by your query. For example:

```zsh
vivi ask "How do I list all files in the current directory?"
```

The plugin sends the query to the LLM and dynamically executes the response in your terminal.

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

## Features

### Dynamic Command Execution
- Queries are processed, and the resulting command is saved as a temporary script file in the plugin's directory.
- The script is executed immediately in the Zsh shell, and the file is automatically deleted afterward.

### Session Context Integration
- Each query incorporates the session context (e.g., current directory, operating system) to provide relevant and accurate responses tailored to the current shell environment.

---

## How It Works

1. **Query Execution**:
    - When you run `vivi ask <query>`, the plugin sends the query to the Gemini API.
    - The query includes relevant session context to improve response accuracy.

2. **Dynamic Execution**:
    - The API response is saved as a Zsh script in the plugin's directory.
    - The script is executed immediately, and the temporary file is deleted to maintain a clean environment.

3. **Configuration**:
    - API keys are securely stored in `~/vivi_config` and loaded when required.

---

By **Dheeraj Chowdary**
