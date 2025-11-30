return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true,       -- Use treesitter for better handling
      fast_wrap = {},        -- Wrap selections quickly
      disable_filetype = { "TelescopePrompt", "vim" },
      map_cr = true,         -- Auto-indent & add closing pair on <CR>
    })

    -- Integrate with nvim-cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
  end,
}

