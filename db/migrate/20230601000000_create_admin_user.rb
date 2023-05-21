class CreateAdminUser < ActiveRecord::Migration[6.1]
  def up
    User.create!(
      email: 'admin@admin.com',
      name: 'admin',
      phone: '111111',
      password: '1234',
      is_admin: true
    )
  end

  def down
    User.find_by(email: 'admin@admin.com', name: 'admin').destroy!
  end
end
