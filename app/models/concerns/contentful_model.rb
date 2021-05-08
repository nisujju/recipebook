module ContentfulModel
  extend ActiveSupport::Concern
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  def model_entry
    self.class.client.entries(content_type: self.class::CONTENT_TYPE_ID, include: 2, "sys.id" => contentful_id).first
  end

  module ClassMethods
    def client
      @client ||= Contentful::Client.new(
        access_token: self::ACCESS_TOKEN,
        space: self::SPACE_ID
      )
    end
  
    def model_entries
      client.entries(content_type: self::CONTENT_TYPE_ID, include: 2)
    end
  end
end