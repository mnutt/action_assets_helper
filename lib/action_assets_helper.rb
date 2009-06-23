module ActionAssetsHelper
  def javascript_include(*scripts)
    @javascript_includes ||= []
    @javascript_includes << scripts
    @javascript_includes.flatten!.uniq!
  end
  
  def stylesheet_link(*stylesheets)
    @stylesheet_links ||= []
    @stylesheet_links << stylesheets
    @stylesheet_links.flatten!.uniq!
  end

  def javascript_include_actions
    javascript_include_tag @javascript_includes if @javascript_includes
  end

  def stylesheet_link_actions
    stylesheet_link_tag @stylesheet_links if @stylesheet_links
  end
end
