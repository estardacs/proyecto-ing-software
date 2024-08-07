require "test_helper"
class UserTest < ActiveSupport::TestCase
  test "Debería ser un usuario permitido" do
    user = users(:one)
    assert user.save, "Usuario permitido"
  end

  test "Deberia ser un nombre de usuario válido" do
    user = users(:tree)
    assert user.save, "Nombre de Usuario en blanco"
  end

  test "Deberia ser un genero no valido" do
    user = users(:four)
    assert_not user.valid?, "Genero no valido"
  end  
  
  test "Deberia ser un mail no valido" do
    user = users(:five)
    assert_not user.valid?, "Mail no válido solo tiene un caracter antes del @uc.cl"
  end

  test "Deberia ser un mail no valido por dominio" do
    user = users(:six)
    assert_not user.valid?, "Mail con dominio distinto a @uc.cl"
  end

  test "Deberia ser tuc no valida" do
    user = users(:seven)
    assert_not user.valid?, "Tuc de largo menor a 7"
  end

  test "Deberia ser un TUC no valido" do
    user = users(:eight)
    assert_not user.valid?, "Tuc de largo mayor a 7"
  end

  test "Deberia ser un Genero no valido" do
    user = users(:nine)
    assert_not user.valid?, "Genero de largo 0"
  end

  test "Deberia ser un mail no valido (sin dominio)" do
    user = users(:ten)
    assert_not user.valid?, "mail sin dominio correcto y sin @"
  end

  test "Deberia ser un usuario valido (nombre largo)" do
    user = users(:eleven)
    assert user.valid?, "User valido"
  end
end
