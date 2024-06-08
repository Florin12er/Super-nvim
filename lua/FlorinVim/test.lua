
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#150E3A",
            color1 = "#3F384C",
            color2 = "#817B63",
            color3 = "#E7DBBC",
            color4 = "#150E3A",
            color5 = "#3F384C",
            color6 = "#817B63",
            color7 = "#E7DBBC",
            color8 = "#150E3A",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#FFFFFF",
            accent3 = "#070708",
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
