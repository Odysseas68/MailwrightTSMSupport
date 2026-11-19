# Mailwright TSM Support

Mailwright TSM Support is a World of Warcraft Forever addon that keeps Mailwright's settings button accessible when TradeSkillMaster (TSM) is also enabled.

## The Problem

Mailwright and TSM both place a button near Blizzard's mailbox close button. When both addons are enabled, the buttons can overlap and obscure Mailwright's settings button.

## The Solution

The companion moves Mailwright's existing settings button 65 UI units to the left of the close button and raises its frame level by 650 relative to the mailbox. The level offset is the workaround validated in-game for this layout. The layout is reapplied as needed when switching back from TSM to the Blizzard/Mailwright mailbox.

## Requirements

- World of Warcraft Forever (Interface `16001`)
- Mailwright
- TradeSkillMaster

Version `0.0.1` was tested in-game on Forever with Mailwright `0.2.13` and TradeSkillMaster `4.15.8`.

## Installation

1. On GitHub, choose **Code → Download ZIP** and extract the archive.
2. Copy the inner `MailwrightTSMSupport` folder into your Forever client's `_forever_/Interface/AddOns/` directory. The TOC and Lua file should be directly inside that folder.

   ```text
   _forever_/
   └── Interface/
       └── AddOns/
           └── MailwrightTSMSupport/
               ├── MailwrightTSMSupport.toc
               └── MailwrightTSMSupport.lua
   ```

3. Start WoW Forever and enable **Mailwright**, **TradeSkillMaster**, and **Mailwright TSM Support** in the AddOns list.

## How It Works

The TOC declares both addons as required dependencies. The companion reads `Mailwright.settingsButton` and verifies that it is a button parented to `MailFrame` before adjusting its anchor and frame level. It checks the layout after Mailwright builds its UI and whenever the Blizzard mailbox becomes visible again. The original button retains its appearance, tooltip, and click behavior. Both upstream addons work from their own installed files.

## Limitations

In-game testing covered the Forever configuration listed above. The addon relies on Mailwright's internal button reference and the current mailbox switching behavior. Upstream updates may require adjustments.

## Credits

- Arametheus, creator of [Mailwright](https://www.curseforge.com/wow/addons/mailwright).
- The team behind [TradeSkillMaster](https://www.curseforge.com/wow/addons/tradeskill-master).

Mailwright TSM Support is an unofficial compatibility addon with no affiliation to either project.
