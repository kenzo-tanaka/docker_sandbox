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
