class Gossip < ApplicationRecord
    has_many :join_table_gossips_tags
    has_many :tags, through: :join_table_gossips_tags
    belongs_to :user, optional: true
  
    validates :title, 
      length: { in: 3..14, message: "Le titre doit avoir entre 3 et 14 caractères." },
      presence: {message: "Il faut un titre :D"}
    validates :content,
      presence: {message: "Il faut du contenu :D"}
      
end