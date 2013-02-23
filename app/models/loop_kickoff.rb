class LoopKickoff
  include Informal::Model

  attr_accessor :coach_email, :subject_email, :reviewer_emails
  validates_presence_of :coach_email, :subject_email, :reviewer_emails

  def self.create(options={})
    kickoff = new(options)
    kickoff.save
    kickoff
  end

  def initialize(options={})
    options.each do |key, val|
      send("#{key}=", val)
    end
  end

  def reviewer_emails
    return [] unless @reviewer_emails
    @reviewer_emails.split(",").map(&:strip).reject(&:empty?)
  end

  def save
    return false unless valid?

    Loop.create(created_by_email: coach_email, subject_email: subject_email, email: coach_email, question_type: :coach)
    Loop.create(created_by_email: coach_email, subject_email: subject_email, email: subject_email, question_type: :subject)
    reviewer_emails.each do |email|
      Loop.create(created_by_email: coach_email, subject_email: subject_email, email: email, question_type: :recipient)
    end
    true
  end
end
