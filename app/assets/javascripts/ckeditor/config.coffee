CKEDITOR.editorConfig = (config) ->
  config.toolbar_Mini = [
    { name: 'styles',      items: [ 'Font' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList' ] },
    { name: 'insert',      items: [ 'Image','HorizontalRule','Smiley' ] },
    { name: 'clipboard',   items: [ 'Undo','Redo' ] }
  ]
  config.toolbar = 'Mini'
  true
