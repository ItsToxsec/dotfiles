

    custom = mkOption {
      default = "";
      type = types.str;
      example = "$HOME/dotfiles/.zshrc";
      description = ''
        Path to a custom oh-my-zsh package to override config of
        oh-my-zsh. See <link xlink:href="https://github.com/robbyrussell/oh-my-zsh/wiki/Customization"/>
        for more information.
      '';
    };


