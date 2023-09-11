class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: true
  validates :status, presence: true, inclusion: { in: %w(draft published ended) }

  enum status: { draft: 0, published: 1, ended: 2 }, _prefix: true

  scope :name_like, ->(v) do
    where(arel_table[:name].matches("%#{v}%")) if v.present?
  end

  scope :price_gteq, ->(v) do
    where(arel_table[:price].gteq(v)) if v.present?
  end

  scope :stock_lteq, ->(v) do
    where(arel_table[:stock].lteq(v)) if v.present?
  end

  scope :statuses_any, ->(v) do
    where(status: v) if v.present?
  end
end
