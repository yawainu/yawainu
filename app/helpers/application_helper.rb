module ApplicationHelper

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

end
