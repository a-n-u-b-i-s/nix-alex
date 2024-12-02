-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local options = {
  -- aleph = 224, -- ascii code for aleph
  allowrevins = false, -- disable reverse insert mode
  ambiwidth = "single", -- all foreign charcters are the same width as US-ASCII
  autochdir = false, -- current nvim dir should stay as project dir
  arabic = false, -- by default no need to type arabic characters
  arabicshape = false, -- by default no need to type arabic characters
  autoindent = true, -- automatically create indentation on newline
  autoread = true, -- update file in nvim when changed on disk
  autowrite = true, -- autosave all nvim edits (use git for version control)
  autowriteall = true, -- autosave all nvim edits (use git for version control)
  background = "dark", -- use dark terminal color for background
  -- backspace option for backspace behavior stays as the default
  backup = false, -- should not create persisted nvim backups
  backupcopy = "yes", -- set to yes to stop https://github.com/webpack/webpack/issues/781#issuecomment-95523711
  -- backupdir option should create backups in the defeault folders
  backupext = "~", -- backed up files are appended with ~
  -- backupskip option should be the default for given operating system
  belloff = "all", -- bell should silence all events in insert mode
  binary = false, -- by default don't edit all files as binary
  bomb = false, -- don't prepend BOMs (byte order marks)
  breakat = " ^I!@*-+;:,./?", -- create visual linebreaks at the following characters
  breakindent = true, -- wrapped lines continue at same horizontal visual indent
  breakindentopt = "", -- uses default breakindent options of min:20,shift:0,list:0
  -- browsedir = "last", -- file browser should remember last position when reopened
  bufhidden = "hide", -- don't unload buffer when not displayed
  buflisted = true, -- list the current buffer in the buffer list
  buftype = "", -- use normal buffers as the default
  -- casemap option should be the default of "internal,keepascii",
  cdhome = true, -- cd, tcd, & lcd w/o arguments redirects to $HOME
  -- cdpath option should be the default search path equal to $CDPATH
  -- cedit key should be the default of CTRL-F
  -- channel option should be set to system default
  charconvert = "", -- use default character encoding conversion
  cindent = false, -- personal perference against C-style indenting
  -- cinkeys aren't specfified since cindent is false
  -- cinoptions aren't specfified since cindent is false
  -- cinwords aren't specfified since cindent is false
  -- cinscopedecls aren't specfified since cindent is false
  clipboard = "", -- allows nvim to access system clipboard
  cmdheight = 1, -- use 2 screen lines for command-line
  cmdwinheight = 7, -- use 7 screen lines for the command-line history window
  colorcolumn = "", -- no need to create highlighted guideline columns
  -- columns option should be set to default of 80 or automatch terminal width
  -- comments option should be "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-"
  -- commentstring option should be the template string of "/*%s*/"
  complete = ".,w,b,u,U,k", -- scan all buffers & dictionary for completion
  completefunc = "", -- don't have any functions for completion
  -- completeslash = "", -- completeslash should follow shellslash
  completeopt = { -- completion suggestion options
    "menuone", -- always show completion popup menu
    "noselect", -- force a selection from the menu
  }, -- end of completion suggestion options
  concealcursor = "", -- don't conceal cursor
  conceallevel = 0, -- show text w/  conceal syntax attribute normally
  confirm = true, -- confirm instead of fail on quiting with unsaved changes
  copyindent = true, -- reuse the indent characters used on previous lines
  -- cpoptions should be the default list of compatible options of "aABceFs_"
  cursorbind = false, -- cursors on seperate windows should not be linked
  cursorcolumn = false, -- don't highlight the full column of the current cursor
  cursorline = true, -- highlight the full line of the current cursor
  -- cursorlineopt aren't specfified since cursorline is false
  debug = "", -- disable debug mode for nvim usage
  -- define option pattern to define macros should match vim default of "^\s*#\s*define"
  delcombine = true, -- delete full unicode characters
  dictionary = "", -- use /usr/share/dict/words & spell
  diff = false, -- disable diff-mode by default
  diffexpr = "", -- use system default diff program
  -- diffopt should be the deault set of "internal,filler,closeoff"
  digraph = false, -- disable writing digraphs in insert mode
  -- directory option should point to the system default directory for swap file
  display = "lastline,uhex", -- put lastline chars in final column & display hex as <xx>
  eadirection = "both", -- equalalways should operate in all directions
  emoji = true, -- emojis should be full width characters
  -- encoding option should match the system default of utf-8
  endofline = true, -- write EOL byte for the last line in the file
  equalalways = true, -- resize windows equally on each new split
  -- equalprg option should use the system default = program
  errorbells = false, -- don't ring the bell for error messages
  -- errorfile option should be the system default of errors.err
  -- errorformat option should use the system default error format
  eventignore = "", -- don't ignore any autocommands
  expandtab = true, -- prefer spaces to tabs due to width conflicts
  fileencoding = "", -- files should be encoded as system default of utf-8
  -- fileencodings option should check in default order of "ucs-bom,utf-8,default,latin1"
  -- fileformat option should use the system default of unix
  -- fileformats option should use the system default of unix,dos
  fileignorecase = true, -- ignore case for filenames
  -- filetype option is local to the buffer
  -- fillchars option should be the vim defaults
  fixendofline = true, -- autofix EOL byte at end of file
  foldclose = "", -- don't autoclose folds when moving out of them (all to autoclose)
  foldcolumn = "auto:9", -- up to 9 columns for fold indication
  foldenable = true, -- enable text folding
  -- foldexpr option not specified since foldmethod is not expr
  -- foldignore option not specified since foldmethod is not indent
  foldlevel = 0, -- default fold level should be 0
  foldlevelstart = -1, -- open buffers w/ all folds closed
  --- foldmarker option specified since foldmethod is not marker
  foldmethod = "manual", -- by default folds are specified manually
  foldminlines = 1, -- only fold with 2+ screen lines
  foldnestmax = 20, -- use max of 20 nested folds
  -- foldopen commands should be the default of "block,hor,mark,percent,quickfix,search,tag,undo"
  -- foldtext option should be the vim default function of foldtext()
  -- formatexpr not specfied since prettier & other plugins will be used
  -- formatlistpat option should be the vim default of "^\s*\d\+[\]:.)}\t ]\s*"
  -- formatoptions are the vim default of "tcqj"
  formatprg = "", -- don't use external programs for formatting
  fsync = false, -- no need to flush to disk on every write
  -- gdefault option has been DEPRECATED
  -- grepformat option should use the default of "%f:%l:%m,%f:%l%m,%f  %l%m"
  -- grepprg command should use the default unix grep program
  -- guicursor option should be the vim default for cursor styles in each mode
  guifont = "Hack:h15", -- use nerdfont patched Hack font with height of 15
  -- guifontwide option isn't set so that double width character have the same font
  -- guioptions options don't need to be different from "egmrLT" since we are using terminal vim
  -- guitablabel not specified since we are using terminal vim
  -- guitabtooltip not specified since we are using terminal vim
  -- helpfile path not specified since it should be the same as the system default
  helpheight = 20, -- :help command window height should be 20
  -- helplang should match os lang system default
  hidden = true, -- enable buffer hiding on unloading
  history = 10000, -- command history should be the maximum supported
  hkmap = false, -- don't map the keyboard to the hebrew character set
  hkmapp = false, -- off since hkmap is also off
  hlsearch = true, -- highlight search pattern matches
  icon = false, -- disable window icon
  iconstring = "", -- empty since icon is disabled
  ignorecase = true, -- by default ignore case in pattern matches
  -- imcmdline = false, -- disabled since imdisable is true
  -- imdisable = true, -- no need for inputs other than mouse / kb
  iminsert = 0, -- IM is off since Input Methods are disabled
  imsearch = -1, -- always match IM insert
  inccommand = "nosplit", -- show the effects of the command incrementally in the buffer
  -- include option should be the default pattern of "^\s*#\s*include"
  -- includeexpr can be the default for vim of ""
  incsearch = true, -- show where patterns match when searching
  -- indentexpr option not specified since indents are to by found by smart indent
  -- indentkeys should be the vim defaults of "0{,0},0),0],:,0#,!^F,o,O,e"
  infercase = false, -- autocomplete should use matched casing
  -- isfname option should match operating system based default
  -- isident option should match operating system based default
  -- iskeyword option should match vim based default set of "@,48-57,_,192-255"
  -- isprint option should match vim default of "@,161-255"
  joinspaces = false, -- insert only one space after puncuation with a join command
  jumpoptions = "stack", -- jumplist should behave like a stack
  -- keymap option doesn't need to be set since IMs are disabled
  keymodel = "", -- no need to enable selection via special keys
  -- keywordprg option should match operating system default
  -- langmap option should not be modified since we are using English
  -- langmenu option should be empty so that it uses v:lang
  langremap = false, -- don't apply language map
  laststatus = 2, -- always show a status line on the last window
  lazyredraw = false, -- redraw screen on macros, registers, & other cmds
  linebreak = false, -- wrap lines till the last character that fits on screen
  -- lines option should match the terminal height
  linespace = 0, -- 0px of linespace between characters
  lisp = false, -- lisp mode disabled by default
  -- lispwords should be the vim default wordlist
  list = false, -- list mode is disabled by default
  -- listchars option should be the vim default set of characters
  loadplugins = true, -- always load plugins
  magic = true, -- allow all special chars in search patterns
  -- makeef option should be the default name for the error file for the :make command
  makeencoding = "", -- don't convert encodings for external command output
  -- makeprg option should use the default program for the :make command
  -- matchpairs option should be the vim default set of characters that come in pairs
  matchtime = 1, -- show matching paren in 100ms
  maxfuncdepth = 100, -- user defined functions have a max recursion depth of 100
  maxmapdepth = 1000, -- map 1000 times before stopping to prevent infintie mappings
  maxmempattern = 2000000, -- allow "unlimited" memory for pattern matching
  menuitems = 25, -- render a maximum of 25 items per menu
  -- mkspellmem option should allocate the vim default amount of memory "460000,2000,500"
  modeline = false, -- disable modelines globally
  modelineexpr = false, -- disable modelines globally
  modelines = 0, -- don't read any modelines
  modifiable = true, -- buffers are modifiable by default
  -- modified option is set locally by each buffer
  more = true, -- listings should pause when the screen is filled
  mouse = "a", -- enable mouse support on all modes
  mousefocus = false, -- focus shouldn't follow mouse movement
  mousehide = true, -- hide mouse pointer when typing
  -- mousemodel options should be the vim default of "popup_setpos"
  mousemoveevent = false, -- don't add mouse move events to a queue
  mousescroll = "ver:1,hor:1", -- scrolling the mouse moves by exactly one character
  -- mouseshape option should be shape config set of "i:beam,r:beam,s:updown,sd:cross,m:no,ml:up-arrow,v:rightup-arrow"
  mousetime = 300, -- < 300ms between clicks is a double click
  nrformats = { -- list of number formats for vim commands
    "alpha", -- ascii +/- for A) B) list items
    "hex", -- base 16 hexadecimal numbers 0x
    "bin", -- base 2 binary numbers 0b
  }, -- end of list of additonal number formats
  number = true, -- show line numbers ahead of every line
  numberwidth = 4, -- use up to 4 columns for line numbers
  -- omnifunc isn't specificed since we aren't using omni completion
  -- opendevice isn't specificed since we aren't on windows
  -- operatorfunc isn't specificed since we don't have a custom operator function
  -- packpath will be managed by packer for vim plugins
  -- paragraphs options should be the vim default nroff macros to seperate paragraphs
  -- paste option is obsolete since bracketed-paste-mode is built-in
  -- pastetoggle not needed since bracketed-paste-mode is built-in
  -- patchexpr should use the default patch program
  patchmode = "", -- only keep newest version of the file from vim patching
  -- path option should be the default for the operating system
  preserveindent = true, -- if editing a file with tabs use tabs to preserve indenting
  previewheight = 12, -- window to preview a file should be 12 screen lines
  -- previewwindow option is set locally to only one window
  -- printdevice option is not specfied for creating hardcopies of files
  -- printencoding option should be the system default print encoding
  -- printexpr should the default expression to generate postscript
  -- printfont = "Hack", -- print with the same font as the editor
  -- printheader should be the vim default page number header of "%<%f%h%m%=Page %N"
  -- printmbcharset option should use the system default CJK charset
  -- printmbfont use the system default fonts for CJK print output
  -- printoptions should be the vim default print options
  pumblend = 15, -- make popup-menu slightly pseudo-transparent
  pumheight = 10, -- maximum number of items to show in popup-menu
  pumwidth = 15, -- minimum width for the popup menu
  -- pyxversion option is always 3 since only python3 is supported
  -- quickfixtextfunc option not specificed since we aren't using the quick fix feature
  -- quoteescape option is the vim default escape character
  readonly = false, -- all buffers are editable by default
  -- redrawdebug option not specificed since we don't need to debug vim
  redrawtime = 2500, -- max time before vim stops redrawing screen
  regexpengine = 0, -- use automatic selection regex engine
  relativenumber = true, -- use relative line numbers
  report = 0, -- always report # of lines changed by command
  revins = false, -- disable reverse insert mode
  rightleft = false, -- use english default of left-to-right
  -- rightleftcmd option not set since rightleft is false
  ruler = true, -- display cursor position in statusline
  -- rulerformat option will be managed by statusline
  -- runtimepath option should be the default for the operating system
  -- scroll option should be the vim default of half the screen size
  scrollback = 10000, -- only load 10k lines beyond viewport
  scrollbind = false, -- disable scrollbinding
  scrolljump = 1, -- only jump a minimum of 1 line if cursor extends beyond screen
  scrolloff = 8, -- keep 8 lines visible around the cursor
  -- scrollopt option not set since scrollbind is false
  -- sections option should be the vim default macros list of "SHNHH HUnhsh"
  secure = false, -- vimrc files are owned by my unix user
  selection = "inclusive", -- use inclusive selecting in visual mode
  -- selectmode option not set since visual mode is preferred
  -- sessionoptions should be the vim default set of preserved session options
  -- shada option should be the default for the operating system
  -- shadafile option not set since since default shada set is used
  -- shell option should use the value of $SHELL variable
  -- shellcmdflag should be the deafult flag for the given operating system
  -- shellpipe should be the vim default shellpipe
  -- shellquote option should be the default for the given operating system
  -- shellredir option should be the default for the given operating system
  -- shellslash option not set since we are not on a windows machine
  shelltemp = true, -- use temp files for shell commands
  -- shellxescape option not set since we are on a unix-based machine
  -- shellxquote option should be the default for the given operating system
  shiftround = true, -- round indentation to multiple of shiftwidth
  shiftwidth = 2, -- number of spaces to use for indenting
  shortmess = "filnxtToOFc", -- append c to disable autocomplete messages
  -- showbreak option should be the vim default for showing breaks on line wrapping
  showcmd = true, -- show command in the last screen line
  showfulltag = false, -- don't show full tags in autocomplete
  showmatch = false, -- don't auto show matching brackets
  showmode = false, -- hide the mode vim is in, statusline will manage it
  showtabline = 2, -- always display the line with tab page labels
  sidescroll = 1, -- min number of cols to scroll horizontally
  sidescrolloff = 8, -- min columns of spacing around cursor
  signcolumn = "yes", -- always draw the sign column
  smartcase = true, -- use smartcase for searching with uppercase
  smartindent = true, -- use vim smart autoindenting
  smarttab = true, -- smart indenting & backspace on tab keypress
  softtabstop = -1, -- use the value of shiftwidth as the softtabstop
  -- spell option not set in order to use code spell checking
  -- spellcapcheck option not set in order to use code spell checking
  -- spellfile option not set in order to use code spell checking
  -- spelllang option not set in order to use code spell checking
  -- spelloptions option not set in order to use code spell checking
  -- spellsuggest option not set in order to use code spell checking
  splitbelow = true, -- :split puts new window below current window
  splitright = true, -- :vsplt puts a new window to the right of current window
  startofline = false, -- keep cursor at the same column if possible
  -- statusline content will be managed by statusline plugin
  -- suffixes list should match vim defaults
  -- suffixesadd not required to add new file extensions for searching
  swapfile = false, -- don't create a swapfile for the buffer
  switchbuf = "uselast", -- switching buffers uses the last used window
  synmaxcol = 999, -- don't syntax highlight beyond 999 columns
  -- syntax option is not set since it is local to the buffer
  -- tabline option is managed by a tabline plugin
  tabpagemax = 50, -- open a max of 50 files via -p command line
  tabstop = 2, -- tab only counts for 2 spaces
  tagbsearch = true, -- use binary search for tag searches
  tagcase = "followic", -- tagcase should follow ignorecase option
  -- tagfunc option not set since vim default function for tag searches should be used
  taglength = 0, -- tags of any length are significant
  tagrelative = true, -- tags file are relative to  where the tags file is
  -- tags option should be the vim default location for tags
  tagstack = true, -- use tagstack normally
  termbidi = false, -- terminak follow vim text direction
  termguicolors = true, -- use 24-bit RGB color in the Terminal
  -- termpastefilter should be the vim default list of "BS,HT,ESC,DEL"
  textwidth = 0, -- disable max text width for inserting / pasting
  -- thesaurus option not set since we aren't using thesaurus completion
  -- thesaurusfunc option not set since we aren't using thesaurus completion
  tildeop = false, -- ~ command shouldn't behave like an operator
  timeout = true, -- stop waiting for multi-key sequence presses
  ttimeout = true, -- stop waiting for multi-key sequence presses in TUI
  timeoutlen = 250, -- stop waiting after 100ms
  title = false, -- don't display window titles
  -- titlelen option not set since title is false
  -- titleold option not set since title is false
  -- titlestring option not set since title is false
  -- undodir option should be the default for the given operating system
  undofile = true, -- save undo history to a file for edited files
  undolevels = 1500, -- undo up to 1500 levels
  undoreload = 10000, -- levels of undo saved when buffer is reloaded
  -- updatecount option not set since swapfile is false
  updatetime = 300, -- save to disk if nothing is typed for more than 300ms
  -- varsofttabstop option not set since softtabstop is set
  -- vartabstop option not set since tabstop is set
  verbose = 0, -- don't trace lua scripts
  -- verbosefile option not set since verbose is 0
  -- viewdir option not set since it should be the vim default path
  -- viewoptions should be the vim default list of folds,cursor,curdir"
  virtualedit = "", -- don't allow any virtual editing in visual mode
  visualbell = false, -- disable the visual bell, use beeping
  warn = true, -- give a warning when a shell cmd is used when buffer has been changed
  ww = "b,s,<,>,[,],h,l", -- move to next line when on last char of prev line
  -- wildchar option should be the vim default char for wildcard expansions
  -- wildcharm option should be the vim default char for wildcard expansions in macros
  wildignore = "", -- don't ignore any files on wildcard pattern matching
  wildignorecase = false, -- don't ignore case during wildcard expansions
  wildmenu = true, -- show a menu of options on wildcard completion
  wildmode = "full", -- complete the next full match
  -- wildoptions option should be the vim default set of wildcard expansion options
  -- winaltkeys option not set since it is only used in Win32
  -- winbar option not set since we don't want to display a window bar
  winblend = 15, -- make floating windows slightly pseudo-transparent
  -- window should be the vim default of screen height - 1
  winfixheight = false, -- don't fix the height of windows
  winfixwidth = false, -- don't fix the width of windows
  -- winheight = 1, -- min number of screen lines for the current window
  -- winhighlight option is not set since it is local to the window
  -- winminheight = 1, -- min number of screen lines for the current window
  -- winminwidth = 1, -- min number of columns for the current window
  -- winwidth = 1, -- min number of columns for the current window
  wrap = true, -- don't wrap lines visually
  wrapmargin = 0, -- don't start wrapping before the end of the screen
  wrapscan = true, -- wrap searches around to the start of the files
  write = true, -- allow writing files to disk
  writeany = true, -- allow writing any file without the need for !
  writebackup = true, -- make a backup before overwriting a file, backup removed after writing
  writedelay = 0, -- 0ms delay before sending characters to the screen
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.fillchars:append({ diff = "╱" })

local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.95))
end

if vim.g.neovide then
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.95
  vim.g.neovide_background_color = "#1a1b26" .. alpha()
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
