class PagesController < ApplicationController
  def contact
  end

  def services
  end

  def about
  end

  def faq
  	@posts = Post.all
  end
end
