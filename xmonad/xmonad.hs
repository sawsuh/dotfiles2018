import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Layout.IndependentScreens
import XMonad.Actions.CopyWindow
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile 

myManageHook = composeAll
    [
      title =? "tiled"          --> unfloat
    , className =? "Firefox"        --> unfloat
    , className =? "muPDF"          --> unfloat
    ] <+> doFloat
    where unfloat = ask >>= doF . W.sink

myWorkspaces = ["one","two","three","four","five","six","seven","eight","nine"]

myLayoutHook = do
    gaps [(U,50), (R,25), (L,25), (D,25)] $ spacingRaw False (Border 0 0 0 0) True (Border 25 25 25 25) True $ layoutHook def
    ||| Full 

keys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keys conf@(XConfig {XMonad.modMask = mod4Mask}) = M.fromList $
    [((m .|. mod4Mask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9] 
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask),(copy, shiftMask .|. controlMask)]]

main = do
    xmonad $ defaultConfig 
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig 
        , modMask = mod4Mask    
        , focusFollowsMouse = False
        , borderWidth = 3
        , focusedBorderColor = "#eee4e5"
        , normalBorderColor = "#42423d"
        , layoutHook = myLayoutHook
        } `additionalKeys`
        [ ((mod4Mask, xK_Return), spawn "bash ~/.t.sh")
        , ((mod4Mask .|. shiftMask, xK_Return), spawn "urxvt -name 'tiled'")
        , ((0, xK_Print), spawn "bash ~/.screenshot.sh")
        , ((mod4Mask, xK_space), spawn "urxvt -title float -g 90x1+595+479 -e bash -c 'LAUNCHER=true /bin/zsh -i -t'")
        , ((mod4Mask .|. shiftMask, xK_c ), kill)
        , ((mod4Mask .|. shiftMask, xK_m ), spawn "bash ~/.t.sh music")
        , ((mod4Mask .|. shiftMask, xK_f ), spawn "bash ~/.t.sh files")
--        , ((mod4Mask .|. shiftMask, xK_t ), spawn "bash ~/.datetoggle.sh")
        , ((mod4Mask, xK_z), windows W.swapDown  ) 
        , ((mod4Mask, xK_x), windows W.swapUp ) 
	, ((mod4Mask, xK_q), spawn "xmonad --recompile; xmonad --restart")
        ]
