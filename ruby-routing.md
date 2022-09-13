# Rails のルーティングを読む

## Railsルータの目的
-`get` して　`to`する
- 命名は`snake_case`

- `DSLメソッド名`とは？
Domain Specific Language 言語を新たに作ることで特定の問題を記述する、プログラミング技法の一種

```ruby
Rails.application.routes.draw do
  resources :brands, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resource :basket, only: [:show, :update, :destroy]

  resolve("Basket") { route_for(:basket) }
end
```

- `resource` を宣言すると何が嬉しいの？
  - controller の index, show, new, edit, create, update, destroy アクションを個別に宣言しなくてもよいため
- コントローラー#アクションってなにを指している？
- namespaceブロックをつかうと、何が嬉しいのか？
- `:shallow`オプションについて
- `collection`について
- `concern`機能について
- `matches?`について
- `root`メソッドについて
- `resolve`メソッドについて
- `:controller`オプションについて
- `:as`オプションについて
- セグメントとは？