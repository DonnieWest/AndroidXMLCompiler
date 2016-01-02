if exists("g:gradle_init_file")
  if android#isAndroidProject()
    if expand('%:t') == 'AndroidManifest.xml'
      XMLns manifest
      compiler manifest
    else
      XMLns android
      compiler layout
    endif
  endif
else
  if expand('%:t') == 'AndroidManifest.xml'
    XMLns manifest
    compiler manifest
  else
    echomsg "Please install the vim-android plugin to make sure this is an Android XML file"
    XMLns android
    compiler layout
  endif
endif

