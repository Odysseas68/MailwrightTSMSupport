# Changelog

## 0.0.1

- Add a Forever compatibility addon that moves Mailwright's existing settings button 65 UI units left of the Blizzard close button and raises it to `MailFrame` level `+650` when both addons are loaded.
- Apply the layout after Mailwright builds the button and check it when the Blizzard mailbox reappears.
- Require Mailwright's known zero-offset close-button anchor and original frame level before applying the workaround. Respect later changes to the same button and check replacement buttons independently.
