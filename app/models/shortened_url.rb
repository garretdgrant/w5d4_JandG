# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not  
#  long_url   :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, uniqueness: true, presence: true
    
 

    after_initialize do |url|
        generate_short_url#, if: ShortenedUrl.new_record?(url_instance)
    end


    
    def self.random_code
        code = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(short_url: code)
            code = SecureRandom.urlsafe_base64
        end
        code
    end 

    private
    def generate_short_url
        if self.short_url == nil
            self.short_url = ShortenedUrl.random_code
        end
    end

end


