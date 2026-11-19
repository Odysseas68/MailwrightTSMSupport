# Mailwright TSM Support

Mailwright TSM Support is a World of Warcraft Forever addon that keeps Mailwright's settings button accessible when TradeSkillMaster (TSM) is also enabled.

## The Problem

Mailwright and TSM both place a button near Blizzard's mailbox close button. When both addons are enabled, the buttons can overlap and obscure Mailwright's settings button.

## The Solution

When it detects the known conflicting layout, the companion moves Mailwright's existing settings button 65 UI units to the left of the close button and sets its frame level to the mailbox level plus 650. Those values were validated in-game. The adjustment stays on the existing button when switching back from TSM to the Blizzard/Mailwright mailbox.

## Requirements

- World of Warcraft Forever (Interface `16001`)
- Mailwright
- TradeSkillMaster

The positioning workaround was tested in-game on Forever with Mailwright `0.2.13` and TradeSkillMaster `4.15.8`.

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

The TOC requires both addons. The companion checks `Mailwright.settingsButton` after Mailwright builds its UI and whenever the Blizzard mailbox becomes visible again. The button must belong to `MailFrame`, have a single anchor from its right edge to the close button's left edge with zero offset, and start at the mailbox frame level plus 10.

The companion remembers the layout it applied to each button. If a later check finds a changed anchor or frame level, it leaves that button alone. A replacement button is checked independently. The original button retains its appearance, tooltip, and click behavior.

## Limitations

In-game testing of the positioning workaround covered the Forever configuration listed above. The addon relies on Mailwright's internal button reference and the current mailbox switching behavior. An unfamiliar layout may still overlap. Upstream updates may require adjustments.

## Credits

- Arametheus, creator of [Mailwright](https://www.curseforge.com/wow/addons/mailwright).
- The team behind [TradeSkillMaster](https://www.curseforge.com/wow/addons/tradeskill-master).

Mailwright TSM Support is an unofficial compatibility addon with no affiliation to either project.
