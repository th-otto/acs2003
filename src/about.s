ShowACSVersion:
[00015870] 2079 000e 7720            movea.l    OldAboutMe,a0
[00015876] 4e90                      jsr        (a0)
[00015878] 4e75                      rts
ShowACSUpdate:
[0001587a] 43f9 000a 45ea            lea.l      ABOUT_UPDATE_WIND,a1
[00015880] 41f9 000a 45ea            lea.l      ABOUT_UPDATE_WIND,a0
[00015886] 4eb9 0005 a366            jsr        Awi_doform
[0001588c] 4e75                      rts
AboutGUIEditor:
[0001588e] 43f9 000a 4548            lea.l      ABOUT_GUI_EDITOR_WIND,a1
[00015894] 41f9 000a 4548            lea.l      ABOUT_GUI_EDITOR_WIND,a0
[0001589a] 4eb9 0005 a366            jsr        Awi_doform
[000158a0] 4e75                      rts
