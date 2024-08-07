FactoryBot.define do
    factory :user do
      email { "user@example.com" }
      password { "password" }
      n_tuc { "123456" }
      nombre_usuario { "testuser" }
      genero { "M" }
    end
  end
  