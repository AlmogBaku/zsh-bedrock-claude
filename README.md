# AWS Bedrock Claude Integration (zsh-bedrock-claude)

A ZSH plugin for seamless integration between [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and AWS Bedrock Claude models. Toggle between Anthropic's direct API and AWS Bedrock deployment with an interactive menu. **Perfect for switching between your Claude Pro account and Bedrock deployment as needed.**

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

## Usage

### Interactive Menu

```bash
bedrock-claude
```

Shows an interactive menu with arrow key navigation:
```
Bedrock + Claude Code integration:
Current status: Enabled

→ Enable
  Disable
```

**Controls:**
- `↑/↓` arrows to navigate between options
- `Enter` to select
- `q` to quit without changes

### What It Does

#### Enable Mode
When you select **Enable**:
- Sets `CLAUDE_CODE_USE_BEDROCK=1`
- Restores your previous model configurations if available
- Claude Code will use AWS Bedrock endpoints

#### Disable Mode  
When you select **Disable**:
- Removes `CLAUDE_CODE_USE_BEDROCK` environment variable
- Saves current model settings for later restoration
- Clears `ANTHROPIC_MODEL` and `ANTHROPIC_SMALL_FAST_MODEL`
- Claude Code will use Anthropic's direct API

## Configuration

### AWS Bedrock Setup

Before using this plugin, ensure you have:

1. **AWS CLI configured** with appropriate credentials:
   ```bash
   aws configure
   ```

2. **Bedrock access** in your AWS region with Claude models enabled

3. **Proper IAM permissions** for Bedrock access:
   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Action": [
           "bedrock:InvokeModel",
           "bedrock:InvokeModelWithResponseStream"
         ],
         "Resource": [
           "arn:aws:bedrock:*::foundation-model/anthropic.claude-*"
         ]
       }
     ]
   }
   ```

### Claude Code Integration

This plugin works seamlessly with [Claude Code](https://docs.anthropic.com/en/docs/claude-code). When enabled, Claude Code will automatically use your AWS Bedrock deployment instead of Anthropic's direct API.

## Environment Variables

The plugin manages these environment variables:

| Variable | Purpose | When Set |
|----------|---------|----------|
| `CLAUDE_CODE_USE_BEDROCK` | Enables Bedrock mode | When "Enable" is selected |
| `ANTHROPIC_MODEL` | Primary model configuration | Managed automatically |
| `ANTHROPIC_SMALL_FAST_MODEL` | Fast model configuration | Managed automatically |
| `_SAVED_ANTHROPIC_MODEL` | Backup of model settings | Internal use only |
| `_SAVED_ANTHROPIC_SMALL_FAST_MODEL` | Backup of fast model settings | Internal use only |

## Use Cases

### Development Workflow
```bash
# Start with Anthropic API for development
bedrock-claude  # Select "Disable"

# Switch to Bedrock for production testing
bedrock-claude  # Select "Enable"

# Back to development
bedrock-claude  # Select "Disable" (restores previous settings)
```

### Cost Optimization
- Use Anthropic API for quick iterations and development
- Switch to Bedrock for production workloads with custom pricing
- Easily compare performance between deployments

### Compliance Requirements
- Use Bedrock when you need data to stay within your AWS VPC
- Switch to Anthropic API when compliance isn't a concern
- Maintain flexibility without code changes

## Troubleshooting

### Bedrock not working
```
Error: Unable to connect to Bedrock
```
**Solution:** Ensure your AWS credentials are configured and you have Bedrock access:
```bash
aws sts get-caller-identity
aws bedrock list-foundation-models --region us-east-1
```

### Models not loading
```
Error: Model not found
```
**Solution:** Verify Claude models are available in your AWS region and you have the necessary permissions.

### Environment variables not persisting
**Solution:** The plugin manages variables for the current session only. If you need persistence, add to your `.zshrc`:
```bash
export CLAUDE_CODE_USE_BEDROCK=1
```

## Comparison with Direct Configuration

| Method | Pros | Cons |
|--------|------|------|
| This Plugin | ✅ Easy toggle<br>✅ State preservation<br>✅ Interactive menu | ❌ Session-based |
| Manual Export | ✅ Persistent<br>✅ Scriptable | ❌ Manual management<br>❌ No state preservation |
| Config Files | ✅ Version controlled<br>✅ Team sharing | ❌ Complex setup<br>❌ Less flexible |

## Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

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