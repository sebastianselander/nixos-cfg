require("tokyonight").setup({
    style = "storm",
    light_style = "day",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "storm",
        floats = "storm",
    },

    sidebars = {
        "qf",
        "help",
        "Lazy",
        "terminal",
    },
})
