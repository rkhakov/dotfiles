local g = vim.g
local M = {}

M.gruvbox = function()
  g.gruvbox_contrast_dark = 'hard'
  g.gruvbox_bold = 1
  g.gruvbox_italic = 1
  g.gruvbox_transparent_bg = 0
  vim.cmd 'colorscheme gruvbox'
end

M.gruvbox_material = function()
  g.gruvbox_material_background = 'hard'
  -- color of line numbers, indent lines, etc.
  g.gruvbox_material_ui_contrast = 'high'

  -- cursor color (Available values: auto, red, orange, yellow, green, aqua, blue, purple
  g.gruvbox_material_cursor = 'auto'
  -- show end of buffer
  g.gruvbox_material_show_eob = 1
  -- enable highlighting lines on error/warning/info/hint
  g.gruvbox_material_diagnostic_line_highlight = 1
  -- disable highlighting text on error/waringng/info/hint
  g.gruvbox_material_diagnostic_text_highlight = 0
  -- g.gruvbox_material_current_word
  g.gruvbox_material_transparent_background = 1
  g.gruvbox_material_current_word = 'grey background'
  -- Colors of color scheme (material, mix, original)
  g.gruvbox_material_palette = 'mix'
  g.gruvbox_material_better_performance = 1
  -- disable italic in comments (0=no, 1=yes)
  g.gruvbox_material_disable_italic_comment = 0
  -- bold in function name
  g.gruvbox_material_enable_bold = 0
  -- enable italic
  g.gruvbox_material_enable_italic = 1
  -- visual color ({green, grey, red} background, reverse)
  g.gruvbox_material_visual = 'grey background'
  -- menu color
  g.gruvbox_material_menu_selection_background = 'green'
  -- sign column (none, default)
  g.gruvbox_material_sign_column_background = 'none'
  -- status line style (mix, original, default)
  g.gruvbox_material_statusline_style = 'mix'
  vim.cmd 'colorscheme gruvbox-material'
end

M.onedarkpro = function()
  local onedarkpro = safe_require("onedarkpro")
  if not onedarkpro then
    return
  end

  onedarkpro.setup({
    -- Theme can be overwritten with 'onedark' or 'onelight' as a string
    theme = function()
      if vim.o.background == "dark" then
        return "onedark"
      else
        return "onelight"
      end
    end,
    colors = { }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    hlgroups = {}, -- Override default highlight groups
    filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
    plugins = { -- Override which plugins highlight groups are loaded
        native_lsp = true,
        polygot = true,
        treesitter = true,
        -- NOTE: Other plugins have been omitted for brevity
    },
    styles = {
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        functions = "NONE", -- Style that is applied to functions
        variables = "NONE", -- Style that is applied to variables
    },
    options = {
        bold = false, -- Use the themes opinionated bold styles?
        italic = false, -- Use the themes opinionated italic styles?
        underline = false, -- Use the themes opinionated underline styles?
        undercurl = false, -- Use the themes opinionated undercurl styles?
        cursorline = true, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    }
  })
  onedarkpro.load()
end

M.material = function()
  local material = safe_require 'material'
  if not material then
    return
  end

  vim.g.material_style = "deep ocean"

  material.setup({
    contrast = {
      sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
      floating_windows = false, -- Enable contrast for floating windows
      line_numbers = false, -- Enable contrast background for line numbers
      sign_column = false, -- Enable contrast background for the sign column
      cursor_line = false, -- Enable darker background for the cursor line
      non_current_windows = false, -- Enable darker background for non-current windows
      popup_menu = false, -- Enable lighter background for the popup menu
    },

    italics = {
      comments = true, -- Enable italic comments
      keywords = false, -- Enable italic keywords
      functions = false, -- Enable italic functions
      strings = false, -- Enable italic strings
      variables = false -- Enable italic variables
    },

    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
      "terminal", -- Darker terminal background
      "packer", -- Darker packer background
      "qf" -- Darker qf list background
    },

    high_visibility = {
      lighter = false, -- Enable higher contrast text for lighter style
      darker = false -- Enable higher contrast text for darker style
    },

    disable = {
      borders = false, -- Disable borders between verticaly split windows
      background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
      term_colors = false, -- Prevent the theme from setting terminal colors
      eob_lines = false -- Hide the end-of-buffer lines
    },

    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_highlights = {} -- Overwrite highlights with your own
  })
  vim.cmd 'colorscheme material'
end


return M
