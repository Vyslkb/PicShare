class Image < ActiveRecord::Base
  
  #has one owner
  belongs_to :user
  #includes a photo
  has_attached_file :photo


# validates that the image has a user id and a photo associated with it,also checks the photo is actually an image file and styles it
# the styles have the filters associated with them
  validates :user_id, presence: true 
  validates_attachment :photo, presence: true,
  content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},size: {less_than: 10.megabytes}
  has_attached_file :photo, styles: { medium: "300x300>", large: "1000x290>", blur: "1000x290>", charcoal:"1000X290",blueshift:"1000X290"},
   convert_options: {blur: "-blur 0x8", charcoal:"-charcoal 0.75",blueshift: "-blue-shift 1.5"}
  
 
  
end
