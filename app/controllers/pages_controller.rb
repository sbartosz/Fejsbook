class PagesController < ApplicationController
  def home
	@title = "Strona startowa"	
  end

  def contact
	@title = "Kontakt"
  end

  def help
	@title = "Pomoc"
  end

end
