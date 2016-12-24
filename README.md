### Overview

<a href="http://ryota-murakami.github.io/" target="_blank">github pages</a>  の実装ブランチです。
static site generaterの<a href="http://system.blog.uuum.jp/entry/2016/02/16/120000" target="_blank">hugo</a>を使用しています。
`public/`ディレクトリに<a href="https://github.com/ryota-murakami/ryota-murakami.github.io" target="_blank">ホスティング用ブランチ</a>をsubmoduleとして登録しており、
実装したものが`hugo`コマンドで`public/`に出力される構成になっています。

### Install

```
$ git clone git@github.com:ryota-murakami/for-hugo-build.git
$ cd for-hugo-build
$ git submodule init
$ git submodule update
```

### Development

```
$ hugo // Compile
$ hugo server // launch web server & edit watch
```

### Deploy

```
$ ./deploy.sh // push to hosting branch
```
