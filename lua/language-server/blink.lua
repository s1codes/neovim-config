return {
  keymap = {
    preset = "super-tab",
  },
  appearance = {
    -- defaults
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    menu = {
      border = "rounded",
      draw = {
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "source_name" },
        },
      },
    },
    accept = {
      auto_brackets = { enabled = true },
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
}
