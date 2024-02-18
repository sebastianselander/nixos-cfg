require("tokyonight").setup({
    style = "night",
    light_style = "day",
    transparent = false,
    styles = {
        comments = {
          italic = false,
        },
        keywords = {
          italic = false,
        },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },

    sidebars = {
        "qf",
        "help",
        "Lazy",
        "terminal",
    },
})

vim.cmd.colorscheme "ayu-mirage"
