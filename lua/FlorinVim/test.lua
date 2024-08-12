
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#181132",
            color1 = "#261C47",
            color2 = "#462F69",
            color3 = "#7A589D",
            color4 = "#181132",
            color5 = "#261C47",
            color6 = "#462F69",
            color7 = "#7A589D",
            color8 = "#181132",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#FFFFFF",
            accent3 = "#F9F9F9",
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
