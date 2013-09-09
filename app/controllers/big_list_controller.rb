class BigListController < ApplicationController
  def index
    @site_count = WebSite.count
    @first_site = WebSite.first
  end
end
