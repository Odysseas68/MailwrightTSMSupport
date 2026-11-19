# MailwrightTSMSupport

- Target WoW Forever, Interface `16001`. Keep version `0.0.1` until a version change is explicitly requested.
- Keep the standalone addon in `MailwrightTSMSupport/`. Limit changes to the settings button's anchor and frame level.
- Treat installed Mailwright and TradeSkillMaster as read-only references. Installation into WoW and Git commits or pushes require explicit authorization.
- Verify dependency names and layout hooks against the installed source when upstream versions change. Record in-game observations separately from static checks.

## Static checks

Run from the repository root with Lua 5.1 and LuaCheck on `PATH`.

```text
luac5.1 -p MailwrightTSMSupport/MailwrightTSMSupport.lua
luacheck MailwrightTSMSupport/MailwrightTSMSupport.lua --no-config --std lua51 --read-globals Mailwright MailFrame MailFrameCloseButton hooksecurefunc
```
