# オーディオインターフェースがなくてもエレキギターの録音はできる

## ギターの録音方法を調べる
気の迷いでエレキギターを始めてみた。始めたばかりであるためとても人前で披露できる腕前ではないが、練習で上達したらTwitterにあげて慈悲深いフォロワーにいいねをねだりたいという気持ちがあった。我が家は賃貸マンションでありアンプの音をマイクで拾うって録音することは難しく、ケーブルで音声信号をパソコンに取り込んで録音するライン録りというやり方で録音する必要がある。

「ライン録り」で検索すると次のような記事がヒットし、大体「オーディオインターフェース」をパソコンにつなげて「DAW」で録音すると書いてある。しかし、オーディオインターフェースが必要となるのは配信などするためのきれいな音源が必要な場合だけで、初心者の練習記録程度の目的ならなくても録音はできる。

## オーディオインターフェースが必要な理由
まず、なぜパソコンでギターの録音をするのにオーディオインターフェースが必要かというと、ギターとパソコンを直結するとまともに音が鳴らないからである。一般的なエレキギターの生信号は弱く、出力部のインピーダンスも高いためパソコンのライン入力に直接つなげても実用に耐えない微弱な信号しか伝わらず、雑音に埋もれてしまう。反面、オーディオインターフェースの入力端子はギターの信号をきれいに拾える構造になっており、パソコンで使える十分な強さに増幅させてパソコンに伝えることができる。

## それでもオーディオインターフェースが不要な理由
上で「ギターの信号を受け取り、十分な強さに増幅するためにオーディオインターフェースが必要」と述べた。つまり「ギターの信号を受け取り十分な強さに増幅する」ことができさえすればオーディオインターフェースでなくともよい。そしてギターアンプはまさしく「ギターの信号を受け取り十分な強さに増幅する」機材であるため、オーディオ出力端子がついているアンプであればアンプとパソコンのライン入力をつなげることで録音はできる。

## 実践
手持ちのギターアンプの[VOX Pathfinder 10](https://amzn.asia/d/6270Kt3)の出力をパソコンのマザーボード([msi B450M MORTAR MAX](https://jp.msi.com/Motherboard/B450M-MORTAR-MAX))のライン入力に接続してWindows11純正の「サウンドレコーダー」で録音したものを添付する。

きらきら星
<audio controls src="./guitar.wav"></audio>

Twitterでフォロワーにいいねをねだるには十分な音質だと思われる。

## アンプにヘッドホン出力しかない場合
Pathfinder 10の出力端子はライン出力とヘッドホン出力兼用であるが、小型の練習用アンプであればライン出力はなくヘッドホン出力しかついていないという製品の方が多い。ヘッドホン出力をライン入力に接続できるかを調べてみたところ以下のページが見つかった

[ヘッドフォン出力をラインレベルに変換する方法を教えて下さい。](https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q1014684740)

内容を読んでみたところ、ヘッドホン出力をライン入力に直結しても大きい問題はないように思えたので、こちらも実験してみることにした。手持ちでヘッドホン出力しかついていないギターアンプがなかったため、代わりにエレキベースをヘッドホンアンプ([VOX amPlug2 Bass ](https://amzn.asia/d/fPPcy9m))につなげ、アンプ出力をパソコンのライン入力につなげた。

ポルノグラフィティのメリッサ
<audio controls src="./bass.wav"></audio>

こちらもこれといった問題なく録音することができた。

## まとめ
以上の内容から分かるように、本格的な録音を目的としない場合であれば高価なオーディオインターフェースを買わずとも手持ちの練習用アンプとパソコン、そしてオーディオケーブルだけでエレキギターの録音はできる。