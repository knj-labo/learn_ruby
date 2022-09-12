# Rails のルーティングを読む

## Railsルータの目的
-`get` して　`to`する
- 命名は`snake_case`

- `DSLメソッド名`とは？
```ruby
Rails.application.routes.draw do
  resources :brands, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resource :basket, only: [:show, :update, :destroy]

  resolve("Basket") { route_for(:basket) }
end
```

- `resource` を宣言するとなにが嬉しいの？
- コントローラー#アクションってなにを指している？
- 