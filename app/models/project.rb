class Project < ActiveRecord::Base
  has_attached_file :document
  validates_attachment_content_type :document, content_type:  ["application/pdf",
            "application/vnd.ms-excel",     
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "application/msword", 
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
            "text/plain"
          ]

  has_many :tasks
  validates :name, :p_type, :description, :start_date, :end_date, :cost, :document, presence: true

end
