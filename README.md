# rich_memo_app

Flutter の理想のアーキテクチャを試すためのアプリ

```
lib
├── app
│   ├── home
│   ├── my_address
│   │   ├── components
│   │   └── providers
│   └── app.dart
├── app_core
│   ├── providers
│   ├── routes
│   ├── theme
│   └── ui_parts
│       ├── app_bars
│       ├── async
│       ├── dialogs
│       └── forms
├── dependency_injection
│   └── dependency_injection.dart
├── domain
│   ├── initial_page_cache
│   ├── my_address
│   └── post_code_search
├── service
│   ├── drift
│   ├── http
│   │   └── interceptors
│   ├── local_notifications
│   ├── package_info
│   ├── platform_permission
│   └── shared_preferences
│       └── data_source
├── util
│   └── extensions
└── main.dart
```

<details>
<summary>参考文献</summary>

- https://github.com/invertase/conference-app
- https://zenn.dev/omiai_techblog/articles/omiai-flutter-architecture
</details>


## app 層
各ページの実装を設置する層。

命名は、Webフロントで多用される `app` を使用。`pages` でもいいが、 `app.dart` を設置するので、少し矛盾してしまう。<br>
よって、抽象的な単語を選択している。Webフロントでは定着している単語なので、受け入れられやすいと判断。

### サブディレクトリ
```
├── app
│   ├── home
│   │   ├── components
│   │   ├── providers
│   │   └── home_page.dart
```

#### xxx_page.dart
「ページ」として認識されるウィジェットを設置する。

反対に、xxx_page.dart 以外のファイルを設置すると汚れて読みづらいので、xxx_page.dart 命名のファイルのみ設置する。

#### components
この feature に関する分離したウィジェット。

`widgets` という命名が一般的だったが、ページもウィジェットであるため、最近は `components` が主流。

基本的にはこの feature でしか使わないものを実装するが、他の feature から参照されることも許容する。

#### providers
この feature に関する NotifierProvider や FutureProvider などを実装。

`components` と同じく、基本的にはこの feature でしか使わないものを実装するが、他の feature から参照されることも許容する。

#### その他
末端のディレクトリなので、 `components` と `providers` 以外のディレクトリ作成も許容する（`constants` など）。

## app_core 層
アプリのテーマや、ページ全体で使用する共通コンポーネントなどを実装する。

命名は、feature-first で feature から切り離した層で使用される `core` と、`app` 層に関することであることをわかりやすくするため。

### サブディレクトリ
```
├── app_core
│   ├── providers
│   ├── router
│   ├── theme
│   └── ui_parts
│       ├── app_bars
│       ├── async
│       ├── dialogs
│       └── forms
```

#### providers
ユーザーの状態や、選択しているカラーテーマ、サインアウトの処理など、画面に関することで Provider を使用したいものの実装を設置する。

#### router
宣言的ルーティング（Router API）を使用する場合に、ルーターの設定を設置する箇所。

#### theme
`ThemeData`、`ColorScheme`、`TextTheme` など、テーマに関するイミュータブルな設定の実装を設置するする。

#### ui_parts
原始的なコンポーネントのパーツを設置する。<br>
ディレクトリ分割のルールは特にない。

## domain
ビジネスロジックの記述。

データクラスとしての `model`、`repository`、必要とあれば `service` （repository の集約）も実装する。

```
├── domain
│   ├── my_address
│   │   ├── models
│   │   │   └── my_address.dart
│   │   └── my_address_repository.dart
```

## dependency_injection
依存性の注入を行う箇所。
`dependency_injection.dart` のみ設置

Riverpod の `ProviderOverride` の配列を返す関数を実装する。

`ProviderContainer` の提供でもいいが、`observers` をここで渡すと意義がブレるので、`ProviderOverride` の配列飲み扱う。

## service 層
`system` や `infrastructure` などでよく命名される層。

SharedPreferences のインスタンスや、Web API のエンドポイント、必要とあらばそれらを使いやすく変更した関数などを実装する。

ビジネスロジックに関わることは書かないのがルールではあるが、パッケージの都合や、自動生成の機能などが絡むと判断が難しくなる。<br>
開発効率を上げるために、ある程度「ビジネスロジックに関わることは書かない」という制約を崩すことも許容する。

## util 層
ビジネスロジックに関わらない、コード簡略化を目的とした実装を設置する。<br>
逆にいうと、ビジネスロジックに関わることを実装してはいけない。<br>
他プロジェクトに移植しても問題なく使える、汎用性の高いものにする。
