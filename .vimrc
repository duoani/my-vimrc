
set modelines=0          " CVE-2007-2438
set nocompatible         " be iMproved, required
set backspace=2          " more powerful backspacing
set autoindent           " 自动缩进
set expandtab            " 将tab转换为空格
set tabstop=4            " Tab的长度等同于4个空格
set shiftwidth=4         " 程序自动缩进时的长度
set so=7                 " 当上下移光标时，保持光标所在行离屏幕第一行/最后一行相距7行
set nowrap               " 不自动换行
set history=1000
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set clipboard+=unnamed   " 共享剪贴板
set autoread             " 设置当文件被改动时自动载入
set autowrite            " 自动保存
set helplang=cn          " 语言设置
set novisualbell         " 去除蜂音
set noerrorbells         " 去除蜂音
set noshowmode
let mapleader=";"        " 定义快捷键的前缀为';'，即<Leader>
set dir=~/.vimswap       " put swap files in a fixed directory

filetype off                  " required  =========== Vendle Plugin Block ===========
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
"call vundle#begin('~/some/path/here') " alternatively, pass a path where Vundle should install plugins

    Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

"    ============ My plugins end =============
" General {
    " ** vim-markdown ** (https://github.com/plasticboy/vim-markdown.git)
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    let g:vim_markdown_folding_disabled=0

    " ** NERDTree ** (https://github.com/scrooloose/nerdtree.git)
    Plugin 'scrooloose/nerdtree'
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> :NERDTreeToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
            let NERDTreeIgnore=['\.DS_Store']
        endif

    " ** nerdtree-git-plugin ** (https://github.com/Xuyuanp/nerdtree-git-plugin.git)
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    " ** tpope/vim-fugitive **
    Plugin 'tpope/vim-fugitive'

    " ** ctrlp.vim ** (https://github.com/kien/ctrlp.vim.git)
    Plugin 'kien/ctrlp.vim'

    " ** vim.airline ** (https://github.com/bling/vim-airline.git)
    Plugin 'bling/vim-airline'
        set laststatus=2
        let g:airline_theme='badwolf'                   " 主题
        "let g:airline_theme='solarized'                   " 主题
        let g:airline_powerline_fonts=1                   " 使用powerline打过补丁的字体
        "let g:airline#extensions#tabline#enabled=1        " 开启tabline
        let g:airline#extensions#tabline#left_sep=' '     " tabline中当前buffer两端的分隔字符
        let g:airline#extensions#tabline#left_alt_sep='|' " tabline中未激活buffer两端的分隔字符
        let g:airline#extensions#tabline#buffer_nr_show=1 " tabline中buffer显示编号
        nnoremap [b :bp<CR>                                 " 映射切换buffer的键位
        nnoremap ]b :bn<CR>                                 " 映射切换buffer的键位

    " ** vim-bufferline **
    Plugin 'bling/vim-bufferline'
        let g:bufferline_modified = '*'
        hi StatusLine cterm=none ctermbg=white ctermfg=yellow gui=none guibg=#3f4d77 guifg=#729eb0 

    " ** vim-indent-guides ** (https://github.com/nathanaelkane/vim-indent-guides.git)
    Plugin 'nathanaelkane/vim-indent-guides'
        "let g:indent_guides_enable_on_vim_startup=1 " 随 vim 自启动
        "let g:indent_guides_start_level=2 " 从第二层开始可视化显示缩进
        "let g:indent_guides_guide_size=1 " 色块宽度
        "let g:indent_guides_auto_colors = 0
        "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#333333 ctermbg=3
        "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333333 ctermbg=4

    " ** vim-colors-solarized ** (https://github.com/altercation/vim-colors-solarized.git)
    Plugin 'altercation/vim-colors-solarized'
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
" }

" Program {
    " ** NERDCommenter ** (https://github.com/scrooloose/nerdcommenter.git)
    Plugin 'scrooloose/nerdcommenter'

    " ** tpope/vim-surround ** (https://github.com/tpope/vim-surround.git)
    Plugin 'tpope/vim-surround'

    " ** scrooloose/syntastic ** 语法检查
    Plugin 'scrooloose/syntastic'

    " ** vim-scripts/taglist.vim **
    Plugin 'vim-scripts/taglist.vim'
        let Tlist_Use_Right_Window = 1        " 让taglist窗口出现在Vim的右边
        let Tlist_File_Fold_Auto_Close = 1    " 当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
        let Tlist_Show_One_File = 1           " 只显示一个文件中的tag，默认为显示多个
        let Tlist_Sort_Type = 'name'          " Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
        let Tlist_GainFocus_On_ToggleOpen = 1 " Taglist窗口打开时，立刻切换为有焦点状态
        let Tlist_Exit_OnlyWindow = 1         " 如果taglist窗口是最后一个窗口，则退出vim
        let Tlist_WinWidth = 32               " 设置窗体宽度为32
        let Tlist_Close_On_Select = 1         " 选择某个tag后自动关闭taglist窗口
        let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function' " 支持JS语法
        map <leader>tt :TlistToggle<CR>
" }

" Javascript {
    " ** vim-javascript ** (https://github.com/pangloss/vim-javascript.git)
    Plugin 'pangloss/vim-javascript'

    " ** vim-json ** (https://github.com/elzr/vim-json.git)
    Plugin 'elzr/vim-json'

    " ** jshint2 **
    Plugin 'Shutnik/jshint2.vim'
        let jshint2_read = 1                   " Lint JavaScript files after reading it.
        let jshint2_save = 1                   " Lint JavaScript files after saving it.
        " let jshint2_close = 0                  " Do not automatically close orphaned error lists.
        let jshint2_confirm = 0                " Skip lint confirmation for non JavaScript files.

    " ** ternjs/tern_for_vim **
    Plugin 'ternjs/tern_for_vim'
" }

" HTML {
    " ** emmet-vim ** (https://github.com/mattn/emmet-vim.git)
    Plugin 'mattn/emmet-vim'
        let g:user_emmet_install_global = 0
        autocmd FileType html,php,css EmmetInstall
        " let g:user_emmet_expandabbr_key = '<c+y>'

    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'Chiel92/vim-autoformat'
        nnoremap <F3> :Autoformat<CR> " map F4 to Jsbeautify
" }
"    ============ My plugins end =============

" All of your Plugins must be added before the following line
call vundle#end()            " required
:filetype plugin indent on    " required
:filetype on
" =========== Vendle Plugin Block ===========

" Vim UI {
    syntax on                                   " show syntax color
    set number                                     " show line number
    set foldenable
    highlight clear SignColumn                     " SignColumn should match background
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set hlsearch                                   " 搜索逐字符高亮
    set showcmd                                    " 输入的命令显示出来，看的清楚些
    set background=dark
    set t_Co=256
    set laststatus=2                               " 总是显示状态行
    color solarized                                " Load a colorscheme }
    set listchars=tab:>-,trail:-
    set list
    

    autocmd InsertLeave * set nocursorline  " 用浅色高亮当前行  
    autocmd InsertEnter * set cursorline    " 用浅色高亮当前行  
    autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup " Don't write backup file if vim is being called by "crontab -e"
    autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup " Don't write backup file if vim is being called by "chpass"
" }

" Key Maps {
    inoremap <silent> <leader>ff <Esc>            " 按;ff映射ESC键
    nnoremap <silent> <leader>sv :so ~/.vimrc<CR> " 按;sv重载配置文件
    inoremap <silent> <S-CR> <Esc>o

    " 窗口操作
    nmap    w=  :resize +10<CR>
    nmap    w-  :resize -10<CR>
    nmap    w,  :vertical resize -10<CR>
    nmap    w.  :vertical resize +10<CR>
" }
