module Forgecms
  class Post < ActiveRecord::Base
    before_validation :set_default_slug

    validates :title, presence: true
    validates :slug, uniqueness: true

    enum status: [ :draft, :review, :published ]
    enum visibility: [ :visible, :password_protected, :hidden ]

    has_many :forgecms_comments, :class_name => 'Forgecms::Comment'
    has_many :forgecms_post_revisions, :class_name => 'Forgecms::PostRevision'
    belongs_to :forgecms_category, :class_name => 'Forgecms::Category'
    belongs_to :user, class_name: 'Forgecms::User'

    after_save :create_revision
    after_destroy :destroy_revisions

    def excerpt
      # Strip HTML tags
      str = ActionController::Base.helpers.strip_tags(body)
      # Limit the length of words.
      str = str.split[0...30].join(' ')
    end

    def set_default_slug
      self.slug = self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') if self.slug.empty?
    end

    protected

    def create_revision
    end

    def destroy_revisions
    end
  end
end
