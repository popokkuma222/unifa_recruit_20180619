class Photo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :image, presence: true

  def set_image(file)
    puts('set image')
    if file.present?
      file_name  =  self.id.to_s + File.extname(file.original_filename)
      output_path = Rails.root.join('public', 'photos', file_name)
      File.open(output_path, 'wb'){|f| f.write file.read}
    end
  end

  def get_file_name
    return self.id.to_s + self.extention
  end
end
