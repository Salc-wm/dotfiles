<p align="center">
    <h1 align="center">Dev $${\color{lightgreen}Toolkit}$$ windows</h1>
    <p align="center">Programs, Tools and Modifications, Plugins for a better Windows for devs.</p>
</p>


# Windows 11
Essential programs to improve the _appearance_ and usability of Windows

That make it easier to modify the default appearance of\
*Windows 11/10* and can improve quality or performance

- → Notepads app
	- _A clean and up-to-date notepad for windows_
- → [`Windhawk`](https://windhawk.net/)
	- _An essential windows customizer for many occasions_
- → [`rectify11`](https://rectify11.net/home)
	- _"ultimate Windows 11 customization tool" A good way to clean Windows, and leave it clean and truly usable_
- → [`Start11`](https://www.stardock.com/products/start11/)
	- _An amazing menu replacement platform_


# Terminal

- → [`Git`](https://git-scm.com/downloads)

→ [**Uv**](https://docs.astral.sh/uv/getting-started/installation/)
> ```Bash
> powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

→ [**fzf**](https://github.com/fuzzy-finder/fzf)
> ```bash
> winget install fzf

→ [**Curl**](https://curl.se/download.html)
> ```bash
> winget install cURL.cURL

→ [**Zoxide**](https://github.com/ajeetdsouza/zoxide)
> ```bash
> winget install ajeetdsouza.zoxide

→ [**Oh My Posh**](https://ohmyposh.dev/)
	- Theme: emodipt-extend
> ```bash
> winget install JanDeDobbeleer.OhMyPosh -s winget

→ [**Posting CLI**](https://posting.sh/guide/)
> ```bash
> # install Posting (will also quickly install Python 3.12 if needed)
> uv tool install --python 3.12 posting
> 
> # install Posting (will also quickly install Python 3.13 if needed)
> uv tool install --python 3.13 posting --prerelease=allow

- → [**Powershell Core**](https://github.com/PowerShell/PowerShell)
	- : [Setup File | - : Config File](https://github.com/Salc-wm/Powershell-WindowsProfile)

<p align="center"><h1 align="center">Editores</h1></p>

## **Vim | Nvim**
- Lazy
	Distro Vim\
	 → [**mini.nvim**](https://github.com/echasnovski/mini.nvim)\
  	 → [**Nightfox**](https://github.com/EdenEast/nightfox.nvim) -< `Theme=Carbonfox`

## **Wez's**
"WezTerm is a powerful cross-platform terminal emulator and multiplexer"\
A very useful and automatically modifiable terminal, along with its ease and capability of configuration thanks to its Lua API

> [!IMPORTANT]  
> The _wezterm_ folder needs to go in the *.config* folder.
→ Config [**file Code**](https://github.com/Salc-wm/Dev-Toolkit-windows/blob/main/wezterm/wezterm.lua)

- Rename the wezterm file to __.wezterm__ or add it to your own
- located at _($HOME/.wezterm.lua)_ or _(Users\ \<USER NAME>)_

## **VS-Code**
| …                         | Extensões            |
| ------------------------- | -------------------- |
| ESLint                    | Stylelint            |
| Better Comments           | Even Better TOML     |
| Markdown All in One       | Material Theme Icons |
| Prettier - Code formatter | Code Runner          |
| Subtle Match Brackets     | TODO Highlight       |

- → *Custom CSS and JS Loader:*
	- CSS → File Code
	- JS  → File Code

## **Rio**
Rio is a Brazilian terminal, simple and fast, in addition to an easy configuration,\
made in rust, it brings great performance to accompany Vim/Nvim

### Configs
- Theme -> [_Code Theme_](https://github.com/Salc-wm/Dev-Toolkit-windows/blob/main/rio/themes/darkMeRio-Slim.toml)
	- **[DarkMeRio](https://github.com/Salc-wm/rio-DarkMe-Terminal/blob/main/README.md)**
- Config -> [_Toml Code_](https://github.com/Salc-wm/Dev-Toolkit-windows/blob/main/rio/config.toml)
  	```toml
  confirm-before-quit = false
  hide-cursor-when-typing = true
  # ignore-selection-foreground-color = false

  theme = "darkMeRio-Slim"

  # Padding-x
  padding-x = 20
  padding-y = [0, 10]

  # Line height
  line-height = 1.4

  # Startup directory
  working-dir = "/Users/<USER>/<YOU HOME>"

  [cursor]
      shape = 'Beam'
      blinking = false
      blinking-interval = 800

  [editor]
      program = "nvim"
  # args = []

  [window]
      blur = false
      opacity = 1.0
      mode = "Fullscreen"
      decorations = "Disabled"

  [renderer]
      level = 1
      target-fps = 165
      backend = "Vulkan"
      performance = "high"
      disable-unfocused-render = false
  # filters = []

  [fonts]
      size = 18

  [scroll]
      multiplier = 3.0
      divider = 1.0

  [navigation]
      mode = "BottomTab"
      clickable = false
      hide-if-single = true
      use-current-path = false
  # color-automation = []

  [platform]
  windows.shell.program = "pwsh"
  windows.shell.args = ["-l", "-NoLogo"]

<p align="center"><h1 align="center">Discord</h1></p>

### **[Vencord](https://vencord.dev/)**

| …… Plugins       | ……           |
| ---------------- | ------------ |
| MessageTags      | OnePingPerDM |
| FixSpotifyEmbeds | SpotifyCrack |
| SpotifyControls  | Experiments  |
| ValidUser        | FakeNitro    |
| MessageLogger    | PinDMs       |
| ImageZoom        | Translate    |

### Themes
- → [Discord Mica](https://betterdiscord.app/theme/Discord%20Mica)
- → [System24](https://betterdiscord.app/theme/system24)
- → [SurCord](https://betterdiscord.app/theme/surCord)
- → [AMOLED-Cord](https://betterdiscord.app/theme/AMOLED-Cord)
- → [SettingsModal](https://betterdiscord.app/theme/SettingsModal)


## *Steam*
### **[Millennium](https://steambrew.app/themes)**

- **USE**:→
	- Theme → [Minimal Dark](https://steambrew.app/theme?id=F4XgbtTW4x5CJmi5DUK3)
	- Plugin  → [SteamDB](https://steambrew.app/plugin?id=c36d5f67c99f)

## Obsidian

| **Plugins**     |                 |
| --------------- | --------------- |
| Iconize         | Excalidraw      |
| Style Settings  | Text Format     |
| Advanced Slides | Smart Typograph |

<p align="center"><h1 align="center">Youtube</h1></p>

## **Plugins**
- → Stands
- → Tweaks for YouTube
- → Screenshot YouTube

### *Tweaks for YouTube*

1. __Original Themes__: By
    - [LawOff](https://github.com/LawOff/YouTubeFluent)
    - [RikisuT](https://github.com/RikisuT/Youtube-Fluent-Theme)
    - [jean0t](https://github.com/jean0t/customize-youtube)

- **Customs** →
    - CSS →> File Code
    - JS →> FIle Code
