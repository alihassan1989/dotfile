import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

myStartupHook = do
     spawnOnce "nitrogen --restore"
     spawnOnce "network-manager-gnome"
     spawnOnce "xsetroot -cursor_name left_ptr"
     spawnOnce "picom --config /home/ali/.config/picom/picom.conf"
     spawnOnce "dunst -conf /home/ali/.config/dunst/dunstrc"
     spawnOnce "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"

myLayout = avoidStruts $ spacing 5 $ Tall 1 (3/100) (1/2)
  where
    -- default tiling algorithm partitions the screen into two panes
         tiled   = Tall nmaster delta ratio
    
    -- The default number of windows in the master pane
         nmaster = 1
    
    -- Default proportion of screen occupied by master pane
         ratio   = 1/2
  
    -- Percent of screen to increment by when resizing panes
         delta   = 3/100


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks def
        { manageHook = myManageHook <+> manageHook def -- make sure to include myManageHook definition from above
        , layoutHook = myLayout 
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , startupHook = myStartupHook
        , terminal= "xterm"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask               , xK_d), spawn "rofi -show drun")
        , ((mod4Mask               , xK_Tab), spawn "rofi -show window")
        ]
