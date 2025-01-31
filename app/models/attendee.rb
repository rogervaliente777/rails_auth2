class Attendee
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :is_available, type: Boolean, default: true
  field :max_limit_of_attendees, type: Integer
  field :speaker_name, type: String

  embedded_in :conference
end
