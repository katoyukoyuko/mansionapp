Rails.application.routes.draw do

  get 'bulletin_boards/index'
  root 'users#show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users,
  path: 'users',
  path_names: { sign_in: :login, sign_out: :logout },
  controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resource :user, only: [:show]

  resource :bulletin_board, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
