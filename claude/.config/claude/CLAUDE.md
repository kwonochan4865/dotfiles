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


## 대화 내용 저장

"대화내용 저장해줘" 라고 하면 `/home/ochan/.config/CLAUDE_LOG` 파일에 아래 형식으로 기록한다.
- 날짜별(YYYY-MM-DD)로 각 1개의 파일을 만들고, 현재 날짜에 맞춰 날짜 파일 로그에 저장한다.
- 파일이 없으면 새로 생성, 있으면 **파일 맨 아래에 이어서 추가**한다.
- 이어서 추가 시, 현재 시간을 기록한다. ## hh-mm-ss
- 오늘 날짜는 시스템 컨텍스트의 `currentDate`를 참조한다.
- 기록 항목: 핵심 의사결정 사항, 수정/추가된 코드 로직 요약, 설치된 도구·패키지, 남은 수동 작업.
- 코드와 함께 **"왜 이렇게 결정했는지"** 근거 위주로 작성한다.
- 같은 날짜 헤더가 이미 있으면 새 헤더를 추가하지 않고 해당 섹션 아래에 이어 붙인다.

## git 관련 설정

### 설정 파일 위치
- 전역 설정: `~/.config/claude/settings.json` (모든 프로젝트 적용)
- 프로젝트 설정: `.claude/settings.json` (해당 프로젝트만 적용)
- 로컬 비밀 설정: `settings.local.json` (.gitignore에 등록되어 커밋 안 됨)

### 권한 설정 (git push 자동 실행)
`~/.config/claude/settings.json`의 `permissions` 섹션:
```json
{
  "permissions": {
    "allow": ["Bash(git push)"],
    "deny": ["Bash(git push --force*)"]
  }
}
```
이 설정으로 "git push 해줘" 하면 자동 실행됨.

### 주의사항
- .env 파일은 절대로 푸쉬하지 마시오.
- git push --force 는 차단됨 (안전장치)


## 로컬 폴더 구조

```
/home/ochan/
├── OneDrive/문서/          ← 주요 작업 폴더 (OneDrive 동기화)
│   ├── 00_받은_파일함/      외부 수신 파일 (스캔, 스마트폰 등)
│   ├── 01_프로젝트/         진행 중인 프로젝트
│   ├── 02_영역/             개인정보·기록·공부 자료
│   ├── 03_리소스/           참고 자료
│   ├── 04_아카이브/         연도별(2022~) 보관
│   └── 99_덤프파일/         임시/분류 전 파일
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
├── .config/claude/         Claude Code 설정 (settings.json, CLAUDE.md 등)
└── .venv/                  Python 가상환경 (~/.venv/bin/python3)
```



