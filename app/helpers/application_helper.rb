module ApplicationHelper

  # meta tag
  def default_meta_tags
    {
      title:       "Title",
      description: "description",
      keywords:    "Ruby,Meta,Tags",
      viewport:    "width=device-width, initial-scale=1",
      #icon: image_url("favicon.ico"),
      noindex: ! Rails.env.production?,
      charset: "UTF-8",
      og: {
        title: "title",
        type: "website",
        url: request.original_url,
        #image: image_url(""),
        site_name: "site name",
        description: "description",
        locale: "ja_JP"
      }
    }
  end

  # page title
  def make_title(page_title = '')
    if page_title.empty?
      'prtfolio maker'
    else
      page_title
    end
  end

  # back link
  def make_back_link(page_link = '')
    if page_link.empty?
      user_info_path(@user)
    else
      page_link
    end
  end

end
