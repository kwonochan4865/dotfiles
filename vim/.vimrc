" ╭──────────────────────────────────────────╮
" │           .vimrc — Catppuccin Mocha       │
" ╰──────────────────────────────────────────╯

" ── 플러그인 (vim-plug) ──────────────────────
call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }   " 테마
Plug 'vim-airline/vim-airline'                   " 상태줄
Plug 'vim-airline/vim-airline-themes'            " 상태줄 테마
Plug 'preservim/nerdtree'                        " 파일 트리
Plug 'airblade/vim-gitgutter'                    " Git 변경 표시
Plug 'tpope/vim-commentary'                      " 주석 토글 (gcc)
Plug 'jiangmiao/auto-pairs'                      " 괄호 자동 완성

" ── Python 전용 ───────────────────────────────
Plug 'davidhalter/jedi-vim'                      " 자동완성, 정의 이동, 문서
Plug 'dense-analysis/ale'                        " 비동기 린팅 & 포맷 (black, flake8)
Plug 'Vimjas/vim-python-pep8-indent'             " PEP8 스마트 들여쓰기
Plug 'vim-python/python-syntax'                  " 향상된 Python 문법 강조
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 퍼지 검색 엔진
Plug 'junegunn/fzf.vim'                          " fzf Vim 통합

call plug#end()

" ── 기본 UI ──────────────────────────────────
set termguicolors
colorscheme catppuccin_mocha

syntax on
set number                  " 줄 번호
set relativenumber          " 상대 줄 번호
set cursorline              " 현재 줄 강조
set signcolumn=yes          " 왼쪽 기호 열 항상 표시
set scrolloff=8             " 스크롤 여백
set sidescrolloff=8
set wrap                    " 줄 바꿈
set showmatch               " 괄호 매칭 강조

" ── 들여쓰기 & 탭 ────────────────────────────
set expandtab               " 탭 → 스페이스
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" ── 검색 ─────────────────────────────────────
set ignorecase              " 대소문자 무시
set smartcase               " 대문자 입력 시 대소문자 구분
set hlsearch                " 검색 결과 강조
set incsearch               " 실시간 검색


" ── 편집 편의 ────────────────────────────────
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set clipboard=unnamed       " 시스템 클립보드 연동
set undofile                " 영구 undo
set undodir=~/.vim/undodir
set noswapfile
set nobackup
set hidden                  " 저장 안 한 버퍼 숨기기 허용
set updatetime=300          " gitgutter 반응 속도

" ── 와일드메뉴 ───────────────────────────────
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.pyc,*.class,node_modules/**,.git/**

" ── 상태줄 (airline) ─────────────────────────
set laststatus=2
set noshowmode              " airline이 모드 표시하므로 중복 제거

let g:airline_theme = 'catppuccin_mocha'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1        " 탭/버퍼 목록
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#gitgutter#enabled = 1

" airline 섹션 커스텀
let g:airline_section_z = '%l/%L : %c'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ' '
let g:airline_symbols.dirty  = ' '

" ── NERDTree ─────────────────────────────────
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI  = 1
let NERDTreeDirArrowExpandable  = ''
let NERDTreeDirArrowCollapsible = ''
let NERDTreeWinSize = 28

" 마지막 창이 NERDTree면 자동 닫기
autocmd BufEnter * if tabpagenr('$') == 1
  \ && winnr('$') == 1
  \ && exists('b:NERDTree')
  \ && b:NERDTree.isTabTree()
  \ | quit | endif

" ── gitgutter ────────────────────────────────
let g:gitgutter_sign_added    = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed  = '▎'

" ── 키맵 ─────────────────────────────────────
let mapleader = " "

" 파일 트리 토글
nnoremap <leader>e :NERDTreeToggle<CR>

" 버퍼 이동
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>q :bdelete<CR>

" 검색 하이라이트 끄기
nnoremap <Esc> :nohlsearch<CR>

" 창 이동 (hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 들여쓰기 유지하며 반복
vnoremap < <gv
vnoremap > >gv

" 줄 이동 (Alt+j/k)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" 저장
nnoremap <leader>w :w<CR>

" ── python-syntax 옵션 ───────────────────────
let g:python_highlight_all = 1          " 모든 강조 기능 활성화
let g:python_highlight_builtins = 1     " len, print 등 내장 함수
let g:python_highlight_exceptions = 1  " Exception, TypeError 등
let g:python_highlight_string_formatting = 1  " f-string, % 포맷
let g:python_highlight_string_format = 1      " .format()
let g:python_highlight_string_templates = 1   " string.Template
let g:python_highlight_indent_errors = 1      " 들여쓰기 오류 표시
let g:python_highlight_space_errors = 0       " 후행 공백 오류 (ALE에서 처리하므로 끔)
let g:python_highlight_doctests = 1           " doctest 블록 강조
let g:python_highlight_class_vars = 1         " cls, self 강조

" ── Python 설정 ──────────────────────────────
" Python 파일에서만 적용
augroup python_settings
  autocmd!
  " PEP8: 79자 가이드라인
  autocmd FileType python setlocal colorcolumn=79
  " 독스트링 들여쓰기 등 PEP8 준수
  autocmd FileType python setlocal textwidth=79
  " 빈 줄도 들여쓰기 유지하지 않음
  autocmd FileType python setlocal nosmartindent
augroup END

" ── jedi-vim (Python 자동완성 & 탐색) ────────
" jedi 자체 자동완성은 끄고 ALE와 충돌 방지
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 0         " 점 입력 시 자동 팝업 끄기 (수동: Ctrl-Space)
let g:jedi#show_call_signatures = 1 " 함수 시그니처 표시
let g:jedi#use_splits_not_buffers = 'right'

" jedi 키맵 (기본값이지만 명시적으로 설정)
let g:jedi#goto_command             = '<leader>gd'  " 정의로 이동
let g:jedi#goto_assignments_command = '<leader>ga'  " 할당으로 이동
let g:jedi#documentation_command   = 'K'            " 문서 보기
let g:jedi#rename_command           = '<leader>rn'  " 심볼 이름 변경
let g:jedi#usages_command           = '<leader>gu'  " 사용처 찾기

" ── ALE (린팅 & 포맷) ────────────────────────
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\ }
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   '*':      ['remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_python_black_options = '--line-length 79'
let g:ale_python_isort_options = '--profile black'
let g:ale_fix_on_save = 0           " 저장 시 자동 포맷은 끔 (수동: <leader>f)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error   = '✘'
let g:ale_sign_warning = '▲'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" airline ALE 통합
let g:airline#extensions#ale#enabled = 1

" ── fzf 설정 ─────────────────────────────────
let g:fzf_layout = { 'down': '~35%' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" ── 파이썬 추가 키맵 ──────────────────────────
" ALE: 수동 포맷 & 린트
nnoremap <leader>f  :ALEFix<CR>
nnoremap <leader>l  :ALELint<CR>
nnoremap <leader>ae :ALEDetail<CR>
nnoremap [d         :ALEPreviousWrap<CR>
nnoremap ]d         :ALENextWrap<CR>

" fzf: 파일/내용 검색
nnoremap <leader>p  :Files<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>/  :BLines<CR>

" Python 실행 (<leader>r)
augroup python_run
  autocmd!
  autocmd FileType python nnoremap <buffer> <leader>r :w<CR>:!python3 %<CR>
augroup END

" ── undodir 생성 ─────────────────────────────
if !isdirectory($HOME . '/.vim/undodir')
  call mkdir($HOME . '/.vim/undodir', 'p')
endif
