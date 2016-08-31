class Noise < ActiveRecord::Base
  belongs_to :song
  has_attached_file :thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
end
