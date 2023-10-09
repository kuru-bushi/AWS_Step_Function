# 環境
- WSL2, Ubuntu 22.04.2 LTS (Jammy Jellyfish)
- apt-get install cmake
- launch.json
    - 

# ミニステップ
1. チュートリアル
    - CMakeLists.txt の作成
    - 外部ライブラリのコンパイル
    - launch.json ででバック
    - AWS S3 からデータの取得,アップロード
    - AWS Lambda, Step Functions の作成(シンプルな構成)
    - launch.json で Lambda, Stedp Function 動かす
    - Lambda, Step Functions を複雑にする


# 処理フロー
1. チュートリアル
    - S3 からデータとる
    - AWS Step Function, Lambda トリガーに起動
2. (ext)model のアップロード
    - 画像系で何かする...?
    - Docker コンテナにあげたい

# 調査
- 使用ライブラリ
    - map, opencv, torch, mlpack(?)
- AWS
    - AWS Step Function doc
        - https://docs.aws.amazon.com/code-library/latest/ug/sfn_code_examples.html
    - AWS SDK for C++ doc
        - https://aws.amazon.com/jp/sdk-for-cpp/
    - SDK 環境構築
        - https://docs.aws.amazon.com/sdk-for-cpp/v1/developer-guide/setup-linux.html
    - S3 からデータとる
        - https://qiita.com/d9magai/items/7c2631fd859c989fec89
    - コードアリで c++, Step Function 動かしてる動画
        - https://www.youtube.com/watch?v=olO5ORrq1cU

- c++
    - CMakeLists.txt, opencv
        - https://wwwms.meijo-u.ac.jp/kohara/technicalreport/opencv_cmake
        - https://docs.opencv.org/4.x/db/df5/tutorial_linux_gcc_cmake.html
    - C++ でバック(launch.json)
        - https://rinatz.github.io/cpp-book/debug-vscode/
        - https://zenn.dev/danishi/articles/aws-sam-local-debug


