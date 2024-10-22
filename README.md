# zsh-wez-man

Show man pages in a new WezTerm pane, keeping your command-line intact.

## Installation

### Install with zinit (recommended)

```zsh
zinit light sei40kr/zsh-wez-man
```

## Customization

| Variable                  | Default value | Description                                                                           |
| :------------------------ | :------------ | :------------------------------------------------------------------------------------ |
| `WEZ_MAN_SPLIT_DIRECTION` | `right`       | Which direction to split the window. Must be one of `left`, `right`, `top`, `bottom`. |
| `WEZ_MAN_SPLIT_SIZE`      | `30%`         | The size of the split. If it ends with `%`, it's relative to the window size.         |

## Tips

If you're using multiple terminals, you may want to load this plugin when you're using WezTerm.

You can do this by checking `$TERM_PROGRAM`:

```zsh
zinit ice if'[[ $TERM_PROGRAM == "WezTerm" ]]'
zinit light sei40kr/zsh-wez-man
```

## Similar Plugins

- [zsh-tmux-man](https://github.com/sei40kr/zsh-tmux-man)
