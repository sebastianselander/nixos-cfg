{-# LANGUAGE ImportQualifiedPost #-}

-- normal haskell stuff

import Control.Monad (when)
import Data.Map qualified as M
import Data.Monoid

import XMonad
import XMonad.Config.Kde

-- window stack manipulation and map creation
import XMonad.StackSet qualified as W

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.WindowSwallowing

-- layout

import XMonad.Layout.IndependentScreens (countScreens)
import XMonad.Layout.LayoutModifier (ModifiedLayout)
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.SubLayouts

-- actions

import XMonad.Actions.CycleWS (nextScreen, shiftNextScreen)
import XMonad.Actions.SpawnOn

-- utils
import XMonad.Util.Cursor
import XMonad.Util.SpawnOnce

-- keys
import Graphics.X11.ExtraTypes.XF86

-- prompts
import XMonad.Layout.Decoration (Decoration, DefaultShrinker)
import XMonad.Layout.Simplest (Simplest)

import Codec.Binary.UTF8.String (decodeString)
import DBus qualified as D
import DBus.Client qualified as D
import XMonad.Layout.Circle

---------------------------------------------------------------------------------------------------
-- USER VARIABLES

myModMask :: KeyMask
myModMask = mod4Mask
myMenu :: String
myMenu = "dmenu_run"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myClickJustFocuses :: Bool
myClickJustFocuses = False
myGaps :: Integer
myGaps = 6
myTerminal :: String
myTerminal = "kitty"
myBrowser :: String
myBrowser = "firefox"
myFont :: String
myFont = "xft:Victor Mono:size=11:SemiBold:antialias=true"

---------------------------------------------------------------------------------------------------
-- HOOKS

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "nitrogen --restore"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "polybar xmonadbar & disown"
    spawnOnce "xset r rate 230 40"
    spawnOnce "mullvad-exclude thunderbird"
    spawnOnce "mullvad-vpn"
    spawnOnce "flameshot"
    spawnOnce "blueman-applet"
    spawnOn "8" "discord"
    spawnOn "9" "thunderbird"

myEventHook :: Event -> X All
myEventHook = swallowEventHook (className =? myTerminal) (return True)

myManageHook :: ManageHook
myManageHook =
    composeOne
        [ className =? "MPlayer" -?> doFloat
        , className =? "Gimp" -?> doFloat
        , className =? "Zoom" -?> doFloat
        , className =? "Blueberry.py" -?> doFloat
        , className =? "nm-connection-editor" -?> doFloat
        , className =? "Nm-connection-editor" -?> doFloat
        , className =? "discord" -?> doShift "8"
        , className =? "thunderbird" -?> doShift "9"
        , className =? "Steam" -?> doFloat
        , resource =? "desktop_window" -?> doIgnore
        , resource =? "kdesktop" -?> doIgnore
        , isFullscreen -?> doFullFloat
        , isDialog -?> doFloat
        , return True -?> insertPosition Below Newer
        ]

myLogHook :: D.Client -> PP
myLogHook dbus =
    def
        { ppOutput = dbusOutput dbus
        , ppCurrent = polybarColor "#00FF00" . wrap "[" "]"
        , ppVisible = polybarColor "#FF0000" . wrap "[" "]"
        , ppHidden = id
        , ppHiddenNoWindows = polybarColor "#444444"
        , ppTitle = const ""
        , ppSep = " | "
        }
  where
    polybarColor :: String -> String -> String
    polybarColor color string = "%{F" <> color <> "}" <> string <> "%{F-}"

-- Requires the program xmonad-log
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let objectPath = D.objectPath_ "/org/xmonad/Log"
    let interfaceName = D.interfaceName_ "org.xmonad.Log"
    let memberName = D.memberName_ "Update"
    let signal =
            (D.signal objectPath interfaceName memberName)
                { D.signalBody = [D.toVariant $ decodeString str]
                }
    D.emit dbus signal

---------------------------------------------------------------------------------------------------
-- SCRATCHPAD

---------------------------------------------------------------------------------------------------
-- LAYOUTS

mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border 0 i 0 i) True (Border i 0 i 0) True

full :: ModifiedLayout Rename (ModifiedLayout Spacing Full) a
full = renamed [Replace "Full"] . mySpacing 0 $ Full

tall :: ModifiedLayout Rename (ModifiedLayout Spacing ResizableTall) a
tall = renamed [Replace "Tall"] . mySpacing myGaps $ ResizableTall 1 (3 / 100) (1 / 2) []

wide :: ModifiedLayout Rename (ModifiedLayout Spacing (Mirror ResizableTall)) a
wide = renamed [Replace "Wide"] . mySpacing myGaps $ Mirror $ ResizableTall 1 (3 / 100) (1 / 2) []

tabs :: ModifiedLayout Rename (ModifiedLayout Spacing (ModifiedLayout (Decoration TabbedDecoration DefaultShrinker) Simplest)) Window
tabs = renamed [Replace "Tabbed"] . mySpacing (myGaps `div` 2) $ tabbed shrinkText myTabConfig

myLayout = avoidStruts $ smartBorders myDefaultLayout
  where
    myDefaultLayout = fullTog (tall ||| tabs {- ||| fullTog wide -})
      where
        fullTog l = toggleLayouts full l

myTabConfig :: Theme
myTabConfig =
    def
        { fontName = "xft:Victor Mono:size=11:SemiBold:antialias=true"
        , activeBorderColor = activeColor myTabConfig
        , inactiveBorderColor = inactiveColor myTabConfig
        , activeTextColor = "#000000"
        , inactiveTextColor = "#000000"
        , decoHeight = 15
        }

---------------------------------------------------------------------------------------------------
-- WORKSPACES

myWorkspaces :: [String]
myWorkspaces = map show [1 .. 9 :: Int]

---------------------------------------------------------------------------------------------------
-- KEYS

myKeys :: Bool -> XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys isDualMonitor conf@(XConfig{XMonad.modMask = modm}) =
    M.fromList $
        workspace
            ++ [
                 -- spawns
                 ((modm, xK_Return), spawn $ XMonad.terminal conf)
               , ((modm, xK_d), spawn myMenu)
               , ((modm, xK_b), spawn myBrowser)
               , -- windows
                 ((modm, xK_q), kill)
               , ((modm, xK_s), sendMessage NextLayout)
               , ((modm, xK_f), sendMessage (Toggle "Full"))
               , ((modm, xK_o), nextScreen)
               , ((modm .|. shiftMask, xK_o), shiftNextScreen)
               , ((modm .|. shiftMask, xK_s), setLayout $ XMonad.layoutHook conf)
               , ((modm, xK_n), refresh)
               , ((modm, xK_Tab), windows W.focusDown)
               , ((modm, xK_j), windows W.focusDown)
               , ((modm, xK_k), windows W.focusUp)
               , ((modm, xK_m), windows W.focusMaster)
               , ((modm .|. shiftMask, xK_j), windows W.swapDown)
               , ((modm .|. shiftMask, xK_k), windows W.swapUp)
               , ((modm, xK_h), sendMessage Shrink)
               , ((modm, xK_l), sendMessage Expand)
               , ((modm, xK_t), withFocused $ windows . W.sink)
               , ((modm, xK_comma), sendMessage (IncMasterN 1))
               , ((modm, xK_period), sendMessage (IncMasterN (-1)))
               , -- keyboard
                 ((modm, xK_space), spawn "~/Documents/git/nixos-cfg/modules/xmonad/keyboardToggle.sh")
               , -- brightness
                 ((0, xF86XK_MonBrightnessUp), spawn "light -A 5")
               , ((0, xF86XK_MonBrightnessDown), spawn "light -U 5")
               , -- volume
                 ((0, xF86XK_AudioMute), spawn "pamixer --toggle-mute")
               , ((0, xF86XK_AudioRaiseVolume), spawn "pamixer -i 3")
               , ((0, xF86XK_AudioLowerVolume), spawn "pamixer -d 3")
               , -- lock screen
                 ((modm .|. controlMask, xK_l), spawn "betterlockscreen --off 900 --wall --blur -l")
               , -- screenshots
                 ((0, xK_Print), spawn "flameshot gui")
               , ((0 .|. shiftMask, xK_Print), spawn "flameshot screen -p ~/Pictures/screenshots")
               , ((0 .|. controlMask, xK_Print), spawn "flameshot full -p ~/Pictures/screenshots")
               ]
                ++ [((modm .|. shiftMask .|. controlMask, xK_Escape) 
                   , spawn "~/Documents/git/nixos-cfg/modules/xmonad/monitors.sh") 
                   | isDualMonitor]
  where
    workspace =
        [ ((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
        ]

-------------------------------------------------------------------------------
-- MAIN

main :: IO ()
main = do
    dbus <- D.connectSession
    _ <-
        D.requestName
            dbus
            (D.busName_ "org.xmonad.Log")
            [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
    isDualMonitor <- (== (2 :: Int)) <$> countScreens
    when isDualMonitor (spawn "~/Documents/git/nixos-cfg/modules/xmonad/monitors.sh")
    xmonad . docks . ewmhFullscreen $
        def
            { terminal = myTerminal
            , focusFollowsMouse = myFocusFollowsMouse
            , clickJustFocuses = myClickJustFocuses
            , borderWidth = 2
            , modMask = myModMask
            , workspaces = myWorkspaces
            , focusedBorderColor = "#41a6b5"
            , normalBorderColor = "#24283b"
            , keys = myKeys isDualMonitor
            , layoutHook = avoidStruts myLayout
            , manageHook = myManageHook
            , handleEventHook = myEventHook
            , startupHook = myStartupHook
            , logHook = dynamicLogWithPP (myLogHook dbus)
            }
