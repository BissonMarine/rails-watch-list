class AddReferencesToList < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :list
  end
end
