class Appointment < ApplicationRecord
  validates :reason, :date, :start_time, :end_time, presence: true
  validate :validate_datetime?

  def self.get_events_data
    all.collect{|a| {
      title: a.reason,#"#{a.start_time.strftime('%l:%M %p')} to #{a.end_time.strftime('%l:%M %p')}",
      start: "#{a.date.strftime('%Y-%d-%m')}T#{a.start_time.strftime('%H:%M:%S')}",
      end: "#{a.date.strftime('%Y-%d-%m')}T#{a.start_time.strftime('%H:%M:%S')}"
    }}.to_json.html_safe
  end

  private

  def validate_datetime?
    if date.present? && start_time.present? && end_time.present?
      if (date.to_formatted_s(:db) rescue ArgumentError) == ArgumentError
        errors.add(:date, 'is invalid')
      elsif (Time.at(start_time) rescue ArgumentError) == ArgumentError
        errors.add(:start_time, 'is invalid')
      elsif (Time.at(end_time) rescue ArgumentError) == ArgumentError
        errors.add(:end_time, 'is invalid')
      elsif (Time.at(start_time) > Time.at(end_time))
        errors.add(:error, "Start time must be less than End Time")
      elsif Appointment.where(date: date).where("start_time <= ? AND end_time >= ?", start_time, end_time).present?
        errors.add(:error, "Appointment exits, Please select different time")
      end
    end
  end

end
