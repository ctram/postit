module Slugable
  extend ActiveSupport::Concern

  def to_param
    self.slug
  end

end
