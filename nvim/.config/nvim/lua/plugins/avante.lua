return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "gemini", -- or "copilot", "gemini", "ollama", "openrouter"
      cursor_applying_provider = "gemini", -- In this example, use Groq for applying, but you can also use any provider you want.
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = true,
        support_paste_from_clipboard = true,
        minimize_diff = false,
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
      },
      vendors = {
        gemini = {
          __inherited_from = "gemini",
          -- endpoint = "https://openrouter.ai/api/v1",
          -- api_key_name = "OPENROUTER_API_KEY",
          model = "gemini-2.5-pro-exp-03-25",
          max_tokens = 10240,
        },
      },
      gemini = {
        __inherited_from = "gemini",
        -- endpoint = "https://openrouter.ai/api/v1",
        -- api_key_name = "OPENROUTER_API_KEY",
        model = "gemini-2.5-pro-exp-03-25",
        max_tokens = 10240,
      },
      -- vendors = {
      --   openrouter = {
      --     __inherited_from = "openai",
      --     endpoint = "https://openrouter.ai/api/v1",
      --     model = "anthropic/claude-3.7-sonnet",
      --     api_key_name = "OPENROUTER_API_KEY_AVANTE",
      --     temperature = 0.6,
      --     max_tokens = 8000,
      --     -- reasoning_effort = "high", -- only supported for reasoning models (o1, etc.)
      --   },
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
