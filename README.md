# Kaigi on Rails2023 Admin Modal Sample

Kaigi on Rails2023 Day2「Hotwireを使って管理画面を簡単にプチSPA化する」で使用したサンプルコードです。

## セットアップ

```bash
docker volume create kaigionrails2023-admin-modal-bundle-cache
docker run --rm -it -v ${PWD}:/rails -v kaigionrails2023-admin-modal-bundle-cache:/bundle ghcr.io/rails/cli bin/setup
docker run --rm -it -v ${PWD}:/rails -v kaigionrails2023-admin-modal-bundle-cache:/bundle -p 3000:3000 ghcr.io/rails/cli bin/dev
```

## License
MIT License.