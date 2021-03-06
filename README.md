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

```shell
docker-compose up -d
docker container ls
# echoコンテナが表示される

# docker-compose.ymlで定義しているコンテナを全て停止・削除
docker-compose down
```

docker-composeはデフォルトではイメージがビルド済みの場合は、ビルドを省略してコンテナの実行をするが、`--build`オプションを付けることで、`docker-compose up`の際には必ずDockerイメージをビルドさせることができる。

```shell
docker-compose up -d --build
```

# Swarm

```shell
cd swarm/
docker-compose -d
```

# Kubernetes

Install cli: [Install and Set Up kubectl on macOS | Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)

Dashboard: [Deploy and Access the Kubernetes Dashboard | Kubernetes](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)


```shell
# Run dashboard
kubectl proxy
# http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
```

Node=クラスタ下に登録されているDockerホスト。

```shell
kubectl get nodes
NAME             STATUS   ROLES                  AGE   VERSION
docker-desktop   Ready    control-plane,master   17m   v1.22.4
```
