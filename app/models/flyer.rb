class Flyer < ActiveRecord::Base
    has_attached_file :image, styles: { thumb: ["64x64#", :jpg], large: ["1000x1000#", :jpg]}, :default_url => 'no-photo.jpg'
    validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/jpg"]}
    
    def self.auto_archive
        @flyers = Flyer.where(:is_live => '1').order(@sort)
        @flyers.each do  |flyer| 
            if flyer.event_date < Date.today
                flyer.update_attributes(:is_live => '0')
            end
        end
    end
end
