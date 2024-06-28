
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#282A36",
            color1 = "#554F69",
            color2 = "#8A7AA7",
            color3 = "#BC92F7",
            color4 = "#282A36",
            color5 = "#554F69",
            color6 = "#8A7AA7",
            color7 = "#BC92F7",
            color8 = "#282A36",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#121211",
            accent3 = "#090A09",
            accent4 = "#FFFFFF",
            accent5 = "#FFFFFF",
            accent6 = "#121211",
          },
        },
        state = {
          custom_state_palette = {
            error = "#D97C8F",
            warning = "#D9AE7E",
            hint = "#D9D87E",
            ok = "#A5D9A7",
            info = "#8BB9C8",
          },
        },
      },
    })

    vim.cmd([[colorscheme palette]])
