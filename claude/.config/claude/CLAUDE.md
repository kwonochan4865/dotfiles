# 컴퓨터 환경
현재 환경은 Thinkpad x1 carbon gen7이며, pop! os COSMIC이며, fictx5를 쓰고 있다.
가상환경은 ~/.venv/bin에 있다.
모든 클로드 설정 파일은 ~/.config/claude에 있다. (`~/.claude`는 심링크로 ~/.config/claude를 가리킴) 

# Claude Code 설정
sudo 권한이 필요하지 않은 한, 자동으로 허가하여 진행한다. 

## 언어

모든 작업은 **무조건 한국어로** 진행해주세요.
- 코드 작성, 주석, 설명 등 모든 커뮤니케이션을 한국어로 진행합니다.
- 변수명, 함수명 등 코드에서 한국어 사용이 불가피한 부분은 영어로 작성합니다.


## 로컬 폴더 구조

```
/home/ochan/
├── Documents/
│   └── Obsidian Vault/     개인 노트
├── Downloads/              임시 다운로드 (정기 정리 대상)
├── weareteam/              고리마케팅 회사 공용 폴더
│   ├── 기술_도구/           마케팅 자동화 도구 모음
│   │   ├── 네이버_검색_구조md파일/
│   │   ├── 노션_구글독스_가공/   노션·구글 독스 데이터 가공 스크립트
│   │   └── 블로그_글쓰기/
│   └── 프로젝트/
│       └── 고리마케팅/
│           ├── blog_generator/
│           └── 홈스케치/
├── 
├── .config/        
│   ├── CLAUDE_LOG.md claude에게 요청해서 기록할 로그
│   └── claude Claude Code 설정 (settings.json, CLAUDE.md 등)
└── .venv/                  Python 가상환경 (~/.venv/bin/python3)

```



