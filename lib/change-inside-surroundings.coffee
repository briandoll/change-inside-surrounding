ChangeInsideSurroundingsView = require './change-inside-surroundings-view'

module.exports =
  activate: ->
    atom.workspaceView.command "change-inside-surroundings:change", => @change()

  change: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.getActivePaneItem()
    editor.insertText('Change inside surrounding')
