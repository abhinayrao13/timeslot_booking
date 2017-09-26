class Event < ApplicationRecord
  validates :reason, :start_date, :end_date, :start_time, :end_time, presence: true
  validate :validate_datetime?

  def self.get_events_data
    all.collect{|a| {
      title: a.reason,
      start: "#{a.start_date.strftime('%Y-%m-%d')}T#{a.start_time.strftime('%H:%M:%S')}",
    end: "#{a.end_date.strftime('%Y-%m-%d')}T#{a.start_time.strftime('%H:%M:%S')}"
    }}.to_json.html_safe
  end

  private

  def validate_datetime?
    if start_date.present? && end_date.present? && start_time.present? && end_time.present?
      if (start_date.to_formatted_s(:db) rescue ArgumentError) == ArgumentError
        errors.add(:start_date, 'is invalid')
      elsif (end_date.to_formatted_s(:db) rescue ArgumentError) == ArgumentError
        errors.add(:end_date, 'is invalid')
      elsif (Time.at(start_time) rescue ArgumentError) == ArgumentError
        errors.add(:start_time, 'is invalid')
      elsif (Time.at(end_time) rescue ArgumentError) == ArgumentError
        errors.add(:end_time, 'is invalid')
      elsif (Time.at(start_time) > Time.at(end_time))
        errors.add(:error, "Start time must be less than End Time")
      end
    end
  end

end
