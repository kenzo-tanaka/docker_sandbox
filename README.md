```shell
docker image build -t example/echo:latest .
```

```shell
docker container run example/echo:latest
curl http://localhost:8080
# -> curl: (7) Failed to connect to localhost port 8080: Connection refused
```

> Dockerコンテナは仮想環境だが、外からは1つの独立したマシンのように扱える特徴がある。
> echoアプリケーションは8080ポートを公開しているが、このポートはコンテナポートと呼ばれるコンテナ内に限定されたポートである。
> P.45

```shell
# バックグランド実行
docker container run -d -p 9000:8080 example/echo:latest

# 名前付き実行
docker container run -t -d --name echo example/echo:latest
docker container stop echo
```

```shell
# 停止しているコンテナ、イメージを一括削除
docker container prune
docker image prune
```
