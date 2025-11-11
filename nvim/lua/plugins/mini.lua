return {
  {'nvim-mini/mini.nvim',
  enabled = true,
  version = false,
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }
  end
  }
}
