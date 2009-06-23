require File.dirname(__FILE__) + '/spec_helper'
require 'action_view/helpers/asset_tag_helper'

describe ActionAssetsHelper do
  include ActionAssetsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper

  it 'should include a single javascript asset from an action' do
    javascript_include("posts_show")
    javascript_include_actions.should == javascript_include_tag("posts_show")
  end

  it 'should include multiple javascript assets from an action' do
    javascript_include("posts_show", "inline_editing")
    javascript_include_actions.should == [javascript_include_tag("posts_show"), javascript_include_tag("inline_editing")].join("\n")
  end

  it 'should not include anything if no assets have been included' do
    javascript_include_actions.should_not be
  end

  it 'should not include duplicate javascripts' do
    javascript_include("posts_show")
    javascript_include("posts_show", "posts_show")
    javascript_include_actions.should == javascript_include_tag("posts_show")
  end

  it 'should include a single css link from an action' do
    stylesheet_link("posts_show")
    stylesheet_link_actions.should == stylesheet_link_tag("posts_show")
  end

  it 'should include multiple css links from an action' do
    stylesheet_link("posts_show", "show_forms")
    stylesheet_link_actions.should == [stylesheet_link_tag("posts_show"), stylesheet_link_tag("show_forms")].join("\n")
  end

  it 'should not include anything if no css links given' do
    stylesheet_link_actions.should_not be
  end

  it 'should not include duplicate stylesheets' do
    stylesheet_link("posts_show")
    stylesheet_link("posts_show", "posts_show")
    stylesheet_link_actions.should == stylesheet_link_tag("posts_show")
  end
end
