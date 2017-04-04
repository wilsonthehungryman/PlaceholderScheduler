class AddContentToSiteContents < ActiveRecord::Migration[5.0]
  def change
    add_column :site_contents, :content, :text
  end
end
