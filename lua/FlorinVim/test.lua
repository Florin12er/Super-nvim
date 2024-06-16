
 require("palette").setup({
      palettes = {
        main = "custom_main_palette",
        accent = "custom_accent_palette",
        state = "custom_state_palette",
      },

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#101319",
            color1 = "#235D56",
            color2 = "#96836F",
            color3 = "#E0EADD",
            color4 = "#101319",
            color5 = "#235D56",
            color6 = "#96836F",
            color7 = "#E0EADD",
            color8 = "#101319",
          },
        },
        accent = {
          custom_accent_palette = {
            accent0 = "#FFFFFF",
            accent1 = "#FFFFFF",
            accent2 = "#141414",
            accent3 = "#040405",
            accent4 = "#FFFFFF",
            accent5 = "#FFFFFF",
            accent6 = "#141414",
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
