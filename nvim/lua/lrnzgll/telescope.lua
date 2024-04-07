require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    grep_string = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
  },
}

require('telescope').load_extension('fzf')
