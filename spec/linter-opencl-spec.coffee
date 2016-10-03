'use babel';

describe 'The OpenCL build provider for Atom Linter',  ->
  linter = require('../lib/linter-opencl').provideLinter().lint
  dirPath = __dirname + '/files'

  beforeEach ->
    waitsForPromise ->
      atom.config.set('linter-opencl.pythonPath', '/usr/bin/python')
      atom.config.set('linter-opencl.openCL.platformIndex', 1)
      atom.config.set('linter-opencl.hybridGraphics.enable', false)
      atom.config.set('linter-opencl.hybridGraphics.offloadingPath', '/usr/bin/optirun')
      atom.config.set('linter-opencl.debug', false)
      atom.packages.activatePackage('language-opencl')
      atom.packages.activatePackage('linter-opencl')
      return atom.packages.activatePackage("linter-opencl")

  it 'should be in the packages list', ->
    expect(atom.packages.isPackageLoaded('linter-opencl')).toBe(true)

  it 'should be an active package', ->
    expect(atom.packages.isPackageActive('linter-opencl')).toBe(true)

  it 'find an error in error.cl', ->
    waitsForPromise ->
      filePath = dirPath + '/error.cl'
      expect(filePath).toExistOnDisk()
      return atom.workspace.open(filePath).then (editor) ->
        return linter(editor).then (messages) ->
          expect(messages.length).toEqual(1)
          expect(messages[0].type).toEqual('error')
          expect(messages[0].text).toEqual('expected \';\' at end of declaration')

  it 'find an error in error.cl', ->
    waitsForPromise ->
      filePath = dirPath + '/correct.cl'
      expect(filePath).toExistOnDisk()
      return atom.workspace.open(filePath).then (editor) ->
        return linter(editor).then (messages) ->
          expect(messages.length).toEqual(0)
