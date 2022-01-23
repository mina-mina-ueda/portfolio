class Contact < ApplicationRecord
  enum subject: { normal: 0, urgent: 1 }
end
