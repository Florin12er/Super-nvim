
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#090818",
            color1 = "#1B1A4B",
            color2 = "#253086",
            color3 = "#6460BD",
            color4 = "#090818",
            color5 = "#1B1A4B",
            color6 = "#253086",
            color7 = "#6460BD",
            color8 = "#090818",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#FFFFFF",
            accent3 = "#D5D5D2",
            accent4 = "#FFFFFF",
            accent5 = "#FFFFFF",
            accent6 = "#FFFFFF",
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
