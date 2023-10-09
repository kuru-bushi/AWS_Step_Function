# 環境
- WSL2, Ubuntu 22.04.2 LTS (Jammy Jellyfish)
- apt-get install cmake
- launch.json
    - 

# ミニステップ
- 


# 処理フロー
1. チュートリアル
    - S3 からデータとる
    - AWS Step Function, Lambda トリガーに起動
    - 正常系, 異常系で分ける
    - 
2. (ext)model のアップロード
    - オープンデータから気温の推移とってくる
    - 前処理など, 
    - 来年の気温を線形モデルで回帰? 画像系にする?

# 調査
- コンパイラが同じになるようローカルと AWS の OS は合わせる?
- C++ で外部ライブラリをコンパイルするには?
- 使用ライブラリ
    - map, opencv, torch, mlpack(?)
- AWS
    - AWS Step Function doc
        - https://docs.aws.amazon.com/code-library/latest/ug/sfn_code_examples.html
    - AWS SDK for C++
        - https://aws.amazon.com/jp/sdk-for-cpp/

- コードアリで c++, Step Function 動かしてる動画
    - https://www.youtube.com/watch?v=olO5ORrq1cU

- C++ でバック(launch.json)
    - https://rinatz.github.io/cpp-book/debug-vscode/

