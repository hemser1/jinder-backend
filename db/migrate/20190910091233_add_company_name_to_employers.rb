class AddCompanyNameToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :company_nane, :string, limit: 45
  end
end
