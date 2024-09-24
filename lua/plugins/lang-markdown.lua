return {
    { import = "lazyvim.plugins.extras.lang.markdown" },
    {
        "iamcco/markdown-preview.nvim",
        enabled = false,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = { "markdown", "Avante", "norg", "rmd", "org" },
            code = {
                sign = false,
                width = "block",
                right_pad = 1,
            },
            heading = {
                sign = false,
                icons = {},
            },
        },
        ft = { "markdown", "Avante", "norg", "rmd", "org" },
    },
}
