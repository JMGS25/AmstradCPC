############################################################################
##                        CPCTELERA ENGINE                                ##
##                 Automatic image conversion file                        ##
##------------------------------------------------------------------------##
## This file is intended for users to automate image conversion from JPG, ##
## PNG, GIF, etc. into C-arrays.                                          ##
############################################################################

##
## NEW MACROS
##

## 16 colours palette
PALETTE=0 1 2 3 6 9 11 12 13 15 16 18 20 24 25 26

## Default values
#$(eval $(call IMG2SP, SET_MODE        , 0                  ))  { 0, 1, 2 }
#$(eval $(call IMG2SP, SET_MASK        , none               ))  { interlaced, none }
#$(eval $(call IMG2SP, SET_FOLDER      , src/               ))
#$(eval $(call IMG2SP, SET_EXTRAPAR    ,                    ))
#$(eval $(call IMG2SP, SET_IMG_FORMAT  , sprites            ))	{ sprites, zgtiles, screen }
#$(eval $(call IMG2SP, SET_OUTPUT      , c                  ))  { bin, c }
#$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
#$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), g_palette ))
#$(eval $(call IMG2SP, CONVERT         , img.png , w, h, array, palette, tileset))

$(eval $(call IMG2SP, SET_FOLDER      , src/assets/sprites  ))
$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), pal_main ))
$(eval $(call IMG2SP, CONVERT         , img/mainchar.png, 	16, 	16, 	sp_mainchar))
$(eval $(call IMG2SP, CONVERT         , img/redball.png , 	16, 	16, 	sp_redball))
$(eval $(call IMG2SP, CONVERT         , img/sword.png   , 	16, 	16, 	sp_sword))