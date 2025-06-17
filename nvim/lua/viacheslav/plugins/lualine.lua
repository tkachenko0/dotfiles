return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    {
                        'branch',
                        separator = { right = '' },
                        right_padding = 0,
                    },
                },
                lualine_b = {
                    'diff',
                },
                lualine_c = {},
                lualine_x = {
                    'diagnostics',
                },
                lualine_y = {
                    'filetype',
                },
                lualine_z = {},
            },
            extensions = { 'fugitive' },
        }
    end
}
