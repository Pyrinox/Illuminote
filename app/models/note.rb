class Note < ApplicationRecord
    has_many :children, class_name: "Note", foreign_key: "parent_id", :validate => false
    belongs_to :parent, class_name: "Note", :validate => false, optional: true
end
