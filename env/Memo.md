## メモ
AmazonLinux2023 を docker compose で実行するようにはまだできていない。

# 手順
1. power shell を管理者権限で開く
2. 下記のコマンド
※参考: https://qiita.com/moritalous/items/f22096f0079a78142220
`
# 何かしらのコンテナ作成
docker run amazonlinux:2023.4.20240416.0
# container ID から export する
docker container ls
docker export -o <保存名> <ContainerID>
docker export -o AML2023_power.tar 5de03e536863

# WSL 内にインポート
cd <任意のディレクトリ WorkDir>
※wsl --import <WSL上で表示するディストリビューション名> <WorkDir> <出力したファイル名>
wsl --import AML2023 C:\Users\USER\WorkSpace\AML2_Step_Functions C:\Users\USER\WorkSpace\AML2023_power.tar

# WSL 上で ディストリビューションに入る
- powershell
wsl -l
wsl -d <ディストリビューション名>
※vscode で開いたがエラーが出て入れない. tar コマンドがないとのこと。
- AM2023
dnf install tar
exit
- powershell
wsl -t <ディストリビューション名>
netsh winsock reset

※レジストリエディタで　DefaultUid の書き換えが必要...?
レジストリエディタ: `\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\`
id の表示: ディストリビューション内でコマンド `id`

# VSCode でAML2023に入る
GUI 操作
cat /etc/os-release

bash-5.2# cat /etc/os-release
NAME="Amazon Linux"
VERSION="2023"
ID="amzn"
ID_LIKE="fedora"
VERSION_ID="2023"
PLATFORM_ID="platform:al2023"
PRETTY_NAME="Amazon Linux 2023.4.20240416"
ANSI_COLOR="0;33"
CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2023"
HOME_URL="https://aws.amazon.com/linux/amazon-linux-2023/"
DOCUMENTATION_URL="https://docs.aws.amazon.com/linux/"
SUPPORT_URL="https://aws.amazon.com/premiumsupport/"
BUG_REPORT_URL="https://github.com/amazonlinux/amazon-linux-2023"
VENDOR_NAME="AWS"
VENDOR_URL="https://aws.amazon.com/"
SUPPORT_END="2028-03-15"

`

2. 

