class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.password.blank?
      flash.now[:alert] = "Пароль не може бути порожнім."
      render :new
      return
    end

    if @user.password_confirmation.blank?
      flash.now[:alert] = "Пароль не може бути порожнім."
      render :new
      return
    end

    if @user.password_confirmation != @user.password
      flash.now[:alert] = "Паролі не співпадають."
      render :new
      return
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      if @user.errors[:email].any? # Проверка ошибок валидации email
        flash.now[:alert] = "Реєстрацію за цією почтой вже здійснено."
      elsif @user.errors[:phone].any? # Проверка ошибок валидации phone
        flash.now[:alert] = "Реєстрацію за цим телефоном вже здійснено."
      else
        flash.now[:alert] = "Не вдалось зареєструватися."
      end
      render :new
    end
  end

  private

  def user_params
    params.permit(:name, :email, :phone, :password, :password_confirmation)
  end
end
