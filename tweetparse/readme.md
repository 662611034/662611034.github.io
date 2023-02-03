# Pythonでツイッターアーカイブのパース

## 背景
ある日突然積み上げたものをぶっ壊したくなり、ツイッターアーカイブをダウンロードしてPythonでツイートを全消しを試みた。その時、ツイートIDを取得するために.jsファイルをパースする必要があるが、少々トラブルがあったためメモを残す。

## 前提
ツイッターアーカイブをダウンロードし、中の「tweets.js」が抽出できていること。

## やり方
1. tweets.js先頭の「window.YTD.tweets.part0 = 」を消し、「[　]」とその中身だけの状態にする。この部分が残っているとPythonでのパースでエラーが生じる
2. 以下のコードを用いてパースする

```Python3
import jason
jdic = json.load(open("./tweets.js", "r"))

print(jdic[0]["tweet"]["edit_info"]["initial"]["editTweetIds"][0])
```

json.loadを実行すれば.jsonが辞書の配列で展開される。要素をprintしてkeyを確認すればツイートのIDが抽出できる。
