import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ICCCMFocus
import XMonad.Util.EZConfig(additionalKeys)                 -- for additionalKeys
import Graphics.X11.ExtraTypes.XF86

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
    { layoutHook         = smartBorders $ layoutHook defaultConfig
    , borderWidth        = 2
    , terminal           = "urxvt"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#ff0000"
    , modMask            = mod4Mask }


-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
-- myConfig = defaultConfig { modMask = mod4Mask , startupHook = spawn "~/.xmonad/startup.sh", logHook = myLogHook} `additionalKeys` addkeys
myConfig = defaultConfig { modMask = mod4Mask , logHook = myLogHook} `additionalKeys` addkeys

myLogHook = do
  takeTopFocus
  dynamicLogWithPP xmobarPP 

-- Custom keys with better dmenu
addkeys = [
        ((mod4Mask, xK_p), spawn "dmenu_run -fn '-bitstream-*-*-*-*-*-28-*-*-*-*-*-*-*' -nb '#ccffff' -nf '#000000' -sb '#00ccff' -sf '#ffffff'"),
        ((0 , xF86XK_AudioLowerVolume), spawn "amixer set Master on && amixer set Headphone on && amixer set Master 2-"),
        ((0 , xF86XK_AudioRaiseVolume), spawn "amixer set Master on && amixer set Headphone on && amixer set Master 2+"),
        ((0 , xF86XK_AudioMute), spawn "amixer set Master toggle && amixer set Headphone toggle"),
        ((0 , xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10"),
        ((0 , xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10"),
        ((0 , xK_Print), spawn "gnome-screenshot")

        ]

--main = xmonad $ defaultConfig
--    { borderWidth        = 2
--    , terminal           = "urxvt"
--    , normalBorderColor  = "#cccccc"
--    , focusedBorderColor = "#ff0000"
--    , modMask            = mod4Mask }
