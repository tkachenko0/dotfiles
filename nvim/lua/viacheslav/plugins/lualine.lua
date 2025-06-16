return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            sections = {
                lualine_a = {
                    'branch',
                },
                lualine_b = {

                },
                lualine_c = {
                    'buffers',
                },
                lualine_x = {
                    'diagnostics',
                },
                lualine_y = {
                    -- 'filetype'
                },
                lualine_z = {

                }
            },
            extensions = { 'fugitive' }
        }
    end
}
