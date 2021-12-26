class RenamePurchaseRecordColumnAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :purchase_record, :order
  end
end
