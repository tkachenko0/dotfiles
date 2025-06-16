return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    'branch',
                },
                lualine_b = {
                    {
                        'buffers',
                        mode = 0, -- 0: name, 1: index, 2: name+index, 3: number, 4: name+number
                        max_length = function() return vim.o.columns * 2 / 3 end,
                        symbols = {
                            modified = ' ●',
                            alternate_file = '',
                            directory = '',
                        },
                        filetype_names = {
                            TelescopePrompt = '',
                            dashboard = '',
                            packer = '',
                            fzf = '',
                            ['neo-tree'] = '',
                            alpha = ''
                        },
                        disabled_buftypes = {
                            'quickfix',
                            'prompt'
                        },
                    }
                },
                lualine_c = {
                },
                lualine_x = {
                    'diagnostics',
                },
                lualine_y = {

                },
                lualine_z = {

                }
            },
            extensions = { 'fugitive' },
        }
    end
}
