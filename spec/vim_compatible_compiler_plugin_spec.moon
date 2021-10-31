describe "vim-compatile compiler plugin", ->
  parse = require('lush.parser')
  compile = require('lush.compiler')
  it "drops any blend", ->
    ast = parse -> {
      A { gui: "italic", blend: 40 }
    }
    compiled = compile(ast, {
      plugins: {require("lush.compiler_plugins.vim_compatible")}
    })
    assert.is_not_nil(compiled)
    assert.matches("italic", compiled[1])
    assert.not.matches("blend", compiled[1])
