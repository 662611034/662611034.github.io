+++
title = "Px Downloaderの代用品"
date = 2025-06-24

[taxonomies]
tags = ["python", "pixiv"]
+++

# Px Downloaderの代用品

AIイラストのおかげでPixivで質・ジャンル・量と三拍子そろった投稿が増えてきて、1つの投稿の画像を一括でローカルにダウンロードする[Px Downloader](https://addons.mozilla.org/ja/firefox/addon/px-downloader/)に大変お世話になっているが、たまに調子が悪くなってファイルをダウンロードできなくなることがある（私はFirefoxしか使っていないが、Chromeの方の状況はどうなんだろうか）。

そこで、Pythonを使って代用品を作ってみた。

```python
import os
import requests
from bs4 import BeautifulSoup
import re
import sys

# リクエストヘッダ。リファラがPixivじゃないと画像にアクセスできない
HEADERS = {
    "Referer": "https://www.pixiv.net/",
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) "
        "Chrome/123.0.0.0 Safari/537.36"
    ),
}


def extract_id_extension(url):  # 投稿IDと拡張子の取得
    match = re.search(r'/(\d+)_p\d+\.(\w+)$', url)
    if match:
        post_id = match.group(1)
        ext = match.group(2)
        return post_id, ext
    else:
        raise Exception("ポストIDと拡張子取得不可")


def get_title(url):  # 投稿タイトルの取得
    res = requests.get(url, headers=HEADERS)
    res.encoding = res.apparent_encoding

    soup = BeautifulSoup(res.text, "lxml")
    desc = soup.find("meta", attrs={"name": "description"})

    title = None
    if desc:
        m = re.search(r'この作品\s*「(.+?)」\s*は', desc.get("content", ""))
        if m:
            title = m.group(1)

    if title:
        return title
    else:
        raise Exception("タイトルが見つかりません")


def dl_1_file(url, outfile):  # URLから画像ファイルをダウンロード
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()

    with open(outfile, "wb") as f:
        f.write(response.content)
    return


def replace_unusable_char(text):  # Windowsで使えない文字を全角に置換
    text = text.replace("/", "／")
    text = text.replace("?", "？")
    text = text.replace("<", "＜")
    text = text.replace(">", "＞")
    text = text.replace("\\", "￥")
    text = text.replace(":", "：")
    text = text.replace("*", "＊")
    text = text.replace("|", "｜")
    text = text.replace("\"", "”")
    return text


def dl_all(url_0, how_many):  # 1枚目URLと枚数指定で全部ダウンロード
    picid, extension = extract_id_extension(url_0)

    try:
        title = get_title(f"https://www.pixiv.net/artworks/{picid}")
        dir_name = replace_unusable_char(title)
    except:
        dir_name = "tmp"

    if not os.path.isdir(dir_name):
        os.mkdir(dir_name)

    for i in range(how_many):
        url = url_0[:url_0.rfind("_")] + f"_p{i}.{extension}"
        outfile = f"{dir_name}/{picid}_p{i:03}.{extension}"
        dl_1_file(url, outfile)
    return


if __name__ == "__main__":
    url_0 = sys.argv[1]
    how_many = int(sys.argv[2])
    dl_all(url_0, how_many)

```

## 使い方

本家の機能を完全には再現できなかったため、かなり手間が増えている。

1. 必要なパッケージをダウンロードする
    - requests
    - lxml
    - BeautifulSoup
2. 投稿の1枚目の原本URLを取得
    - "https://i.pximg.net/img-original/img/2024/12/09/01/46/41/125025264_p0.png"みたいなやつ
3. urlと枚数を指定して実行
    - 仮にpxdl.pyで保存したとする
    - 例：python pxdl.py https://i.pximg.net/img-original/img/9999/99/99/99/99/99/9999999_p0.png 334

画像の投稿ページURLのHTMLを取得してもファイルの拡張子、トータル枚数、ユーザIDが分からなかったため、その辺を手動で取得しないといけない。本家のありがたみが身に染みる。

とはいえ、手動保存よりは楽なので、必要だったら使ってみてほしい。
