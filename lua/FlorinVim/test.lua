
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#142238",
            color1 = "#6D374C",
            color2 = "#8297B1",
            color3 = "#DFBAB8",
            color4 = "#142238",
            color5 = "#6D374C",
            color6 = "#8297B1",
            color7 = "#DFBAB8",
            color8 = "#142238",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#111010",
            accent3 = "#080909",
            accent4 = "#FFFFFF",
            accent5 = "#FFFFFF",
            accent6 = "#111010",
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
