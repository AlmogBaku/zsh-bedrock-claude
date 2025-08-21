# AWS Bedrock Claude Integration (zsh-bedrock-claude)

A ZSH plugin for seamless integration between [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and AWS Bedrock Claude models. Toggle between Anthropic's direct API and AWS Bedrock deployment with an interactive menu. **Perfect for switching between your Claude Pro account and Bedrock deployment as needed.**

## Quick Start

```console
$ bedrock-claude

Bedrock + Claude Code integration:
Current status: Enabled

→ Enable
  Disable
```

## Features

- 🔄 **Easy toggle** between Anthropic API and AWS Bedrock
- 💳 **Claude Pro integration** - easily switch to use your Pro account
- 🎯 **Interactive menu** with arrow key navigation
- 💾 **State preservation** - remembers your model configurations
- ⚡ **Instant switching** - no restart required
- 🧠 **Smart model management** - automatically handles model variables
- 🔧 **Environment integration** - seamlessly works with Claude Code

## Installation

### Oh My Zsh

1. **Clone the plugin to your custom plugins directory:**
   ```bash
   git clone https://github.com/AlmogBaku/zsh-bedrock-claude.git \
     $ZSH_CUSTOM/plugins/bedrock-claude
   ```

2. **Add `bedrock-claude` to your plugins list in `~/.zshrc`:**
   ```bash
   plugins=(
     git
     bedrock-claude
     # ... your other plugins
   )
   ```

3. **Reload your shell:**
   ```bash
   source ~/.zshrc
   # or restart your terminal
   ```

That's it! The plugin will be automatically loaded by Oh My Zsh.

### Alternative Installation Methods

<details>
<summary>Antidote Plugin Manager</summary>

1. **Add to your `.zsh_plugins.txt`:**
   ```
   AlmogBaku/zsh-bedrock-claude
   ```

   Or **bundle directly in your `.zshrc`:**
   ```bash
   antidote bundle AlmogBaku/zsh-bedrock-claude
   ```

2. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

</details>

<details>
<summary>Manual Installation</summary>

1. **Download the script:**
   ```bash
   curl -o ~/.zsh/bedrock-claude.zsh \
     https://raw.githubusercontent.com/AlmogBaku/zsh-bedrock-claude/main/bedrock-claude.plugin.zsh
   ```

2. **Source in your `.zshrc`:**
   ```bash
   source ~/.zsh/bedrock-claude.zsh
   ```

</details>

## How It Works
To be fair, this is super naive and simple - a quick helper utility.


The plugin manages environment variables to control Claude Code's behavior:
- **Enable**: Sets `CLAUDE_CODE_USE_BEDROCK=1` and restores saved model configurations
- **Disable**: Removes the Bedrock flag and saves current model settings for later restoration


## Why Use This Plugin?

- **Easy Toggle**: Switch between Anthropic API and AWS Bedrock with a simple command
- **State Preservation**: Remembers your model configurations when switching
- **Interactive Menu**: User-friendly interface with arrow key navigation
- **Session-Based**: Quick switching without permanent configuration changes

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) by Anthropic
- Inspired by [awsctx](https://github.com/AlmogBaku/zsh-awsctx) for AWS profile switching
- Designed to work seamlessly with AWS Bedrock Claude models

## Related Projects

- [zsh-awsctx](https://github.com/AlmogBaku/zsh-awsctx) - Switch between AWS profiles
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - Official Claude CLI tool
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) - Framework for managing Zsh configuration
- [AWS Bedrock](https://aws.amazon.com/bedrock/) - AWS's managed AI service
