require('nvim-tree').setup({
        git = {
            ignore = false,
        },
        renderer = {
            group_empty = true,
            icons = {
                show = {
                    folder_arrow = false,
                },
            },
            indent_markers = {
                enable = true,
            },
        },
        view = {
            side = "right",
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true
        },
    })

