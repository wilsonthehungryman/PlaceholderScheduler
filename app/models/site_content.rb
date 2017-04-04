#
class SiteContent < ApplicationRecord
  validates :content, :page, :index, presence: true
  validates :index, uniqueness: { scope: :page }
  before_create do
    renderer = Redcarpet::Render::HTML.new(filter_html: false, no_image: false,
                                           no_links: false)
    markdown = Redcarpet::Markdown.new(renderer)
    self.content = markdown.render(content)
  end
end
