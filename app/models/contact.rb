class Contact < ApplicationRecord
  enum subject: { app: 0, st: 1 }
end
