# Monochrome Neovim theme

It's code, not fruit salad. Even if fruit salad is very tasty, I just had too much.

Adapted from [quiet](https://github.com/vim/vim/blob/master/runtime/colors/quiet.vim) in the [vim](https://github.com/vim/vim/blob/master/runtime/colors/quiet.vim) repository.

## Install

Sorry but I have no idea how to write plugins. I'm a real dumb-dumb.
I just use [LazyVim](https://lazyvim.org) and this is how I set it up.
So far, this seems to work.

```lua
  {
    "veggiemonk/quiet2",
    name = "quiet2",
    priority = 1000,
    lazy = false,
    config = function()
      require("quiet2").setup()
    end,
  },
```

## Screenshot

<img width="856" alt="Screenshot 2024-05-05 at 15 42 15" src="https://github.com/veggiemonk/quiet2/assets/5487021/5f013464-5fa7-4593-9a64-ac2535ffb00d">
