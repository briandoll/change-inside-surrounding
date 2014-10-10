{WorkspaceView} = require 'atom'
ChangeInsideSurroundings = require '../lib/change-inside-surroundings'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ChangeInsideSurroundings", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('change-inside-surroundings')

  describe "when the change-inside-surroundings:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.change-inside-surroundings')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'change-inside-surroundings:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.change-inside-surroundings')).toExist()
        atom.workspaceView.trigger 'change-inside-surroundings:toggle'
        expect(atom.workspaceView.find('.change-inside-surroundings')).not.toExist()
