require("tokyonight").setup({
    style = "storm",
    light_style = "day",
    transparent = false,
    styles = {
        comments = {
          italic = true,
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
