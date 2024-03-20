return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
        config = function(_, opts)
            local tokyonight = require("tokyonight")
            tokyonight.setup(opts == {}) -- not use transparent
            tokyonight.load()
        end,

    },
}
