module LinksHelper
  def get_short_url a_link
    root_url + a_link.in_url
  end
end
