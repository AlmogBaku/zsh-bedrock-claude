#!/usr/bin/env zsh
bedrock-claude() {
    local options=("Enable" "Disable")
    local selected=0
    
    # Determine current status
    local current_status
    if [[ -n "$CLAUDE_CODE_USE_BEDROCK" ]]; then
        current_status="Enabled"
        selected=0  # Default to Enable option
    else
        current_status="Disabled"
        selected=1  # Default to Disable option
    fi
    
    while true; do
        printf "\033[2J\033[H"
        echo "Bedrock + Claude Code integration:"
        echo "Current status: $current_status"
        echo ""        
        for i in {0..1}; do
            if [[ $i -eq $selected ]]; then
                echo "→ ${options[$((i+1))]}"
            else
                echo "  ${options[$((i+1))]}"
            fi
        done
        
        read -k key
        if [[ $key == $'\033' ]]; then
            read -k key
            if [[ $key == '[' ]]; then
                read -k key
                case $key in
                    'A') selected=$((selected > 0 ? selected - 1 : 1)) ;;  # Up arrow
                    'B') selected=$((selected < 1 ? selected + 1 : 0)) ;;  # Down arrow
                esac
            fi
        elif [[ $key == $'\n' ]]; then
            break
        elif [[ $key == 'q' ]]; then
            echo
            return 0
        fi
    done
    
    echo
    case $selected in
        0)  # Enable
            export CLAUDE_CODE_USE_BEDROCK=1
            # Restore previous values if they were saved
            if [[ -n "$_SAVED_ANTHROPIC_MODEL" ]]; then
                export ANTHROPIC_MODEL="$_SAVED_ANTHROPIC_MODEL"
                unset _SAVED_ANTHROPIC_MODEL
            fi
            if [[ -n "$_SAVED_ANTHROPIC_SMALL_FAST_MODEL" ]]; then
                export ANTHROPIC_SMALL_FAST_MODEL="$_SAVED_ANTHROPIC_SMALL_FAST_MODEL"
                unset _SAVED_ANTHROPIC_SMALL_FAST_MODEL
            fi
            ;;
        1)  # Disable
            unset CLAUDE_CODE_USE_BEDROCK
            # Save current values if they exist
            if [[ -n "$ANTHROPIC_MODEL" ]]; then
                export _SAVED_ANTHROPIC_MODEL="$ANTHROPIC_MODEL"
            fi
            if [[ -n "$ANTHROPIC_SMALL_FAST_MODEL" ]]; then
                export _SAVED_ANTHROPIC_SMALL_FAST_MODEL="$ANTHROPIC_SMALL_FAST_MODEL"
            fi
            # Unset the variables
            unset ANTHROPIC_MODEL
            unset ANTHROPIC_SMALL_FAST_MODEL
            ;;
    esac
}
