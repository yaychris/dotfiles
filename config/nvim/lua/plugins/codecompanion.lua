local gh = require('util').gh

vim.pack.add {
  gh 'olimorris/codecompanion.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'MeanderingProgrammer/render-markdown.nvim',
}

require('render-markdown').setup { file_types = { 'markdown', 'codecompanion' } }

require('codecompanion').setup {
  adapters = {
    acp = {
      claude_code = function()
        return require('codecompanion.adapters').extend('claude_code', {
          defaults = {
            session_config_options = {
              model = 'sonnet',
              effort = 'medium',
            },
          },
        })
      end,
    },
  },
  interactions = {
    chat   = { adapter = 'claude_code' },
    inline = { adapter = 'claude_code' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', { desc = '[A]I [C]hat' })
vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionActions<CR>',     { desc = '[A]I [A]ctions' })
vim.keymap.set('v',          '<leader>as', '<cmd>CodeCompanionChat Add<CR>',     { desc = '[A]I Add [S]election to chat' })
