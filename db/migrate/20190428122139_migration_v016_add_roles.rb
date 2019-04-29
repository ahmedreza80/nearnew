class MigrationV016AddRoles < ActiveRecord::Migration[5.1]
  def up
    create_table :roles do |t|
      t.string :name
    end
    table = Arel::Table::new(:roles)
    [[1, 'admin'],[2, 'agent'],[3, 'user']].each do |id, name|
      manager = Arel::InsertManager.new
      manager.into(table).insert([
        [table[:id],   id],
        [table[:name], name]
      ])
      execute(manager.to_sql)
    end

    add_column :users, :role_id, :bigint
   
    table   = Arel::Table.new(:users)
    manager = Arel::UpdateManager.new
    manager.table(table)
    manager.set([[table[:role_id], 3]]).where(table[:role_id].eq(nil))
    execute(manager.to_sql)

    change_column   :users, :role_id, :bigint, null: false, default: 3
    add_foreign_key :users, :roles, name: :fk_users_on_role_id
  end
  def down
    remove_foreign_key :users, name: :fk_users_on_role_id
    remove_column :users, :role_id
    drop_table :roles
  end
end
