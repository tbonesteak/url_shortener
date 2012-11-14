class Url < ActiveRecord::Base
  attr_accessible :original_url, :short_url

  validates :original_url, :format => { :with => /http:\/\/.+/ }, :presence => true

  validates :short_url, :presence => true

end
