# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html
# import urllib.request
# from qutebrowser.api import cmdutils

# class MiscCommands:
#     @cmdutils.register(instance='config-commands')
#     def alright(self):
#         from qutebrowser.components import scrollcommands
#         from qutebrowser.mainwindow import tabbedbrowser, mainwindow
#         from qutebrowser.utils import objreg
#         print("ok")
#         r = urllib.request.urlopen("http://127.0.0.1:80")
#         print(r.read())

#         target = config.val.new_instance_open_target
#         win_id = mainwindow.get_window(via_ipc=True, target=target)
#         tabbed_browser = objreg.get('tabbed-browser', default=None,
#                                     scope='window', window=0)
#         print(tabbed_browser.get_current_url())
#         scrollcommands.scroll(cmdutils.Value.cur_tab, "down")


# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(True)

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.cookies.accept', 'all', 'https://*.slack.com/*')
config.set('content.cookies.accept', 'all', 'https://app.element.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

c.hints.selectors = c.hints.selectors | {"toggle": ['[class*="expand"]', '[class*="togg"]']}

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', True, 'https://*.slack.com')
config.set('content.notifications.enabled', True, 'https://app.element.io')

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
# c.scrolling.smooth = True
c.scrolling.smooth = False
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
# config.unbind("<")
config.bind(">>", "tab-move +")
config.bind("<<", "tab-move -")
config.bind("x", "tab-close")
config.bind("X", "undo")
config.bind("o", "set-cmd-text -s :open -t")
config.bind("O", "set-cmd-text -s :open")
config.bind("<Alt-;>", "set-cmd-text -s :tab-select")
config.bind("a", "tab-focus last")
config.bind("j", "scroll-px 0 100")
config.bind("}", "ok")
config.bind("<Ctrl-e>", "scroll-px 0 100")
config.bind("<Ctrl-y>", "scroll-px 0 -100")
config.bind("<Ctrl-k>", "spawn -u ctrl-k")
config.bind("k", "scroll-px 0 -100")
config.bind("u", "scroll-page 0 -0.4")
config.bind("e", "spawn -u passthrough")
config.bind("d", "scroll-page 0 0.4")
config.bind("b", "set-cmd-text -s :bookmark-load -t")
config.bind("B", "set-cmd-text -s :bookmark-load")
config.bind("<Alt-l>", "spawn --userscript qute-lastpass {url:host}")
config.bind("<Alt-l>", "spawn --userscript qute-lastpass {url:host}", mode="insert")
config.bind(";c", "hint toggle")
config.bind("yf", "hint links yank")
config.bind(";h", "hint all userscript open-firefox")
config.bind("<Space>sc", "search ;; mode-enter caret ;; selection-drop ;; mode-leave")

config.source('nord-qutebrowser.py')
c.qt.highdpi = True
c.tabs.last_close = 'close'
c.tabs.pinned.frozen = True
c.auto_save.session = True
c.tabs.max_width = 250
c.tabs.min_width = 100
c.content.blocking.method = "both"
c.colors.webpage.preferred_color_scheme = "dark"
c.editor.command = ["emacsclient", "{file}"]
c.downloads.location.prompt = False
c.tabs.title.format_pinned = ""
c.zoom.default = 125
c.url.searchengines = {"DEFAULT": "https://www.google.com/search?q={}" }
c.fonts.default_size = "8pt"
# c.fonts.web.size.default = 18

# config.set("colors.webpage.darkmode.enabled", True)
