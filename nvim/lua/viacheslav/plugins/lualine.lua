return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local diagnostics_config = {
            'diagnostics',
            sources = { "nvim_diagnostic" },
            symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' '
            }
        }

        local branch_config = {
            'branch',
        }

        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = 'vscode',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { branch_config },
                lualine_c = {
                    'buffers'
                },
                lualine_x = { diagnostics_config, 'filetype' },
                lualine_y = {},
                lualine_z = {}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    }
                },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'fugitive' }
        }
    end
}
