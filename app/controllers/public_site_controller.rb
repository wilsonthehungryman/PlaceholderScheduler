class PublicSiteController < ApplicationController
  def get_content(page)
    SiteContent.where(active: true).where(page: page).order(index: :asc)
  end

  def index
    @contents = get_content('index')
  end

  def contact
    @contents = get_content('contact')
  end

  def about
    @contents = get_content('about')
  end

  def pricing
    @contents = get_content('pricing')
  end

  def demo
    @contents = get_content('demo')
  end
end
