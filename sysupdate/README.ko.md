# sysupdate

<p align="right">
  <a href="./README.ko.md"><img src="https://img.shields.io/badge/한국어-2f80ed?style=for-the-badge&label=Language&labelColor=1f2937" alt="한국어"></a><a href="./README.en.md"><img src="https://img.shields.io/badge/English-555555?style=for-the-badge&label=%20&labelColor=1f2937" alt="English"></a>
</p>

Ubuntu/Debian 계열 Linux에서 시스템 업데이트를 한 번에 실행할 수 있는 명령어 설치 도구입니다.

설치 후 아래 명령어만 입력하면 됩니다.

```bash
sysupdate
```

## 기능

`sysupdate`는 내부적으로 다음 명령어를 실행합니다.

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove --purge -y
sudo apt autoclean -y
```

## 지원 환경

이 도구는 `apt`를 사용하는 Linux 배포판을 기준으로 합니다.

예시:

- Ubuntu
- Debian
- Linux Mint
- Pop!_OS
- Elementary OS

Fedora, Arch Linux, openSUSE처럼 `apt`를 사용하지 않는 배포판에서는 동작하지 않습니다.

## 설치 방법

저장소를 클론합니다.

```bash
git clone https://github.com/GYJeong-AI/ubuntu-toolkit.git
cd ubuntu-toolkit/sysupdate
```

설치 스크립트에 실행 권한을 부여합니다.

```bash
chmod +x ./install.sh
```

설치합니다.

```bash
./install.sh
```

설치 후 실행합니다.

```bash
sysupdate
```

## 한 줄 설치

이미 저장소를 클론한 상태라면 아래 명령어만 실행하면 됩니다.

```bash
chmod +x ./install.sh && ./install.sh
```

## 설치 위치

기본 설치 위치는 다음과 같습니다.

```bash
~/.local/bin/sysupdate
```

`~/.local/bin`이 `PATH`에 없으면 설치 스크립트가 현재 셸에 맞는 설정 파일에 자동으로 추가합니다.

예시:

```bash
~/.bashrc
```

또는:

```bash
~/.zshrc
```

추가되는 내용은 다음과 같습니다.

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## 설치 확인

```bash
command -v sysupdate
```

정상적으로 설치되었다면 다음과 비슷하게 출력됩니다.

```bash
/home/username/.local/bin/sysupdate
```

## 사용 방법

설치 후 터미널 어디에서든 아래 명령어를 실행하면 됩니다.

```bash
sysupdate
```

## 삭제 방법

설치된 명령어를 삭제합니다.

```bash
rm ~/.local/bin/sysupdate
```

필요하다면 `~/.bashrc` 또는 `~/.zshrc`에서 아래 줄도 삭제할 수 있습니다.

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## 주의사항

이 도구는 `apt full-upgrade`를 사용합니다.

`full-upgrade`는 패키지 의존성 해결 과정에서 필요한 경우 기존 패키지를 제거할 수 있습니다. 일반적인 개인 PC에서는 대체로 문제 없지만, 운영 서버나 중요한 개발 환경에서는 실행 전 변경 내용을 확인하는 것이 안전합니다.

더 보수적으로 사용하려면 설치 후 아래 파일을 엽니다.

```bash
nano ~/.local/bin/sysupdate
```

아래 줄을:

```bash
sudo apt full-upgrade -y
```

다음처럼 바꿉니다.

```bash
sudo apt upgrade -y
```

## 라이선스

MIT License