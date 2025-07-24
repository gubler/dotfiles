# Qutebrowser configuration file
# Documentation: https://qutebrowser.org/doc/help/configuring.html

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(True)

# General settings
c.url.default_page = "https://www.kagi.com"
c.url.start_pages = "https://www.kagi.com"

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://www.kagi.com/search?q={}",
    "w": "https://en.wikipedia.org/wiki/{}",
}

# Key bindings
config.bind("J", "tab-next")
config.bind("K", "tab-prev")
config.bind("j", "scroll down")
config.bind("k", "scroll up")
config.bind("h", "scroll left")
config.bind("l", "scroll right")

# Downloads
c.downloads.location.directory = "~/Downloads"

# Tabs
c.tabs.position = "top"
c.tabs.show = "multiple"

# Fonts (adjust to your preference)
c.fonts.default_family = "monospace"
c.fonts.default_size = "14pt"

# Content settings
c.content.autoplay = False
c.content.javascript.enabled = True
