# ai-guidelines

어떤 컴퓨터에서 작업을 하던지 동일한 개발 경험을 가져가기 위해  
특정 프로젝트에 종속되지 않는 글로벌 설정 파일들을 한 곳에서 관리합니다.

각 도구가 기대하는 경로에 symlink를 걸어서, 설정 파일의 원본은 이 저장소에서 버전 관리하고 실제 도구는 평소처럼 동작하게 합니다.

## 제공하는 설정들

- OpenCode용 [AGENTS.md](./opencode/AGENTS.md)
  - Commit Rules
  - Pull Request Rules
  - Dependency Management

## Setup

```bash
# 프로젝트 clone
git clone https://github.com/ndaemy/ai-guidelines.git ~/.config/ai-guidelines

# symlink 생성
cd ~/.config/ai-guidelines
./install.sh
```

clone 위치는 어디든 상관없습니다. `install.sh`가 절대 경로 기반으로 symlink를 생성하기 때문에 저장소 위치에 의존하지 않습니다.

> 이미 같은 경로에 설정 파일이 있으면 `.bak` 확장자로 백업한 뒤 symlink를 생성합니다.
> 이미 올바른 symlink가 걸려 있으면 건너뜁니다.

## Structure

```
opencode/
  AGENTS.md    → ~/.config/opencode/AGENTS.md
```
