module Defaultable
  def default(related_collection_symbol)
    self.send(related_collection_symbol).first
  end
end
