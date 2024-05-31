
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#0F0A1F",
            color1 = "#25355C",
            color2 = "#876186",
            color3 = "#C3CEDE",
            color4 = "#0F0A1F",
            color5 = "#25355C",
            color6 = "#876186",
            color7 = "#C3CEDE",
            color8 = "#0F0A1F",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#FFFFFF",
            accent3 = "#080707",
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
